#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <X11/Xlib.h>
/* #include <X11/Xft/Xft.h> */

void set_dock_ewmh_info(Display *d, Window w) {
  Atom type = XInternAtom(d, "_NET_WM_WINDOW_TYPE_DOCK", False);
  XChangeProperty(
      d,
      w,
      XInternAtom(d, "_NET_WM_WINDOW_TYPE", False),
      XInternAtom(d, "ATOM", False),
      32,
      PropModeReplace,
      (unsigned char *)&type,
      1
      );

  int insets[12] = {0, 0, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0};
  XChangeProperty(
      d,
      w,
      XInternAtom(d, "_NET_WM_STRUT_PARTIAL", False),
      XInternAtom(d, "CARDINAL", False),
      32,
      PropModeReplace,
      (unsigned char *)&insets,
      12
      );
}

int main() {
  Display* d = XOpenDisplay(NULL);

  if (d == NULL) {
    fprintf(stderr, "Cannot open display\n");
    return 1;
  }

  int s = DefaultScreen(d);
  int width = WidthOfScreen(DefaultScreenOfDisplay(d));
  long white = WhitePixel(d, s);
  long black = BlackPixel(d, s);
  GC gc = DefaultGC(d, s);

  XSetForeground(d, gc, white);

  Window w = XCreateSimpleWindow(
      d,
      RootWindow(d, s),
      0,
      0,
      width,
      36,
      0,
      black,
      black
      );

  set_dock_ewmh_info(d, w);

  XSelectInput(d, w, ExposureMask);
  XMapWindow(d, w);

  while (True) {
    XEvent e;
    XNextEvent(d, &e);

    if (e.type == Expose) {
      const char *msg = "Hello, World!";
      XDrawString(d, w, gc, 0, 10, msg, strlen(msg));
    }
  }

   XCloseDisplay(d);
   return 0;
}

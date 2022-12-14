/*  "x_misc-n.c.X1"*/
  static void DoSpecialEnterNotify  _PARAMS((register XEnterWindowEvent *ev));  
  static void DoSpecialLeaveNotify  _PARAMS((register XEnterWindowEvent *ev));  
  static int ChangeGroup  _PARAMS((String attribute, XtArgVal value));  
  static void withdraw_window  _PARAMS((Display *dpy, Window w, int scr));  
/*  "x_screen-n.c.X1"*/
  static int Reallocate  _PARAMS((ScrnBuf *sbuf, Char **sbufaddr, int nrow, int ncol, int oldrow, int oldcol));  
/*  "x_screen.nok-n.c.X1"*/
  static int Reallocate  _PARAMS((ScrnBuf *sbuf, Char **sbufaddr, int nrow, int ncol, int oldrow, int oldcol));  
/*  "x_scrollbar-n.c.X1"*/
  static void ResizeScreen  _PARAMS((register XtermWidget xw, int min_width, int min_height));  
  static Widget CreateScrollBar  _PARAMS((XtermWidget xw, int x, int y, int height));  
  static void RealizeScrollBar  _PARAMS((Widget sbw, TScreen *screen));  
  static void ScrollTextTo  _PARAMS((Widget scrollbarWidget, caddr_t closure, float *topPercent));  
  static void ScrollTextUpDownBy  _PARAMS((Widget scrollbarWidget, Opaque closure, int pixels));  
  static int specialcmplowerwiths  _PARAMS((char *a, char *b));  
  static int params_to_pixels  _PARAMS((TScreen *screen, String *params, int n));  
/* "x_tabs-n.c.X1" */
/* "x_test_loop-n.c.X1" */
  static int C2F _PARAMS((vide))(void);  
/* 1 "x_util-n.c.X1"*/
  static void copy_area  _PARAMS((TScreen *screen, int src_x, int src_y, unsigned int width, unsigned int height, int dest_x, int dest_y));  
  static void horizontal_copy_area  _PARAMS((TScreen *screen, int firstchar, int nchars, int amount));  
  static void vertical_copy_area  _PARAMS((TScreen *screen, int firstline, int nlines, int amount));  
/* 1 "x_zzledt-n.c.X1" */
  static void move_right  _PARAMS((char *source, int max_chars));  
  static void move_left  _PARAMS((char *source));  
  static void display_string  _PARAMS((char *string));  
  static void get_line  _PARAMS((int line_index, char *source));  
  static void save_line  _PARAMS((char *source));  
  static void backspace  _PARAMS((int n));  
  static void erase_nchar  _PARAMS((int n));  
  static int lines_equal  _PARAMS((char *source, int line_index));  
  static void strip_blank  _PARAMS((char *source));  
  static int gchar_no_echo  _PARAMS((void));  
  static int translate  _PARAMS((int ichar));  
  static int search_line_backward  _PARAMS((char *source));  
  static int search_line_forward  _PARAMS((char *source));  

@echo off
if not exist %1 goto ext
\totala\tools\cobble %1
goto done

:ext
\totala\tools\cobble %1.bos

:done


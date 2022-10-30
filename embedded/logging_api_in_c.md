### Generic function to log things with timestamp in C

```
#include <time.h>
#define LOG_FILE "log_file.txt" // Path to output log file
#define APPLY_PRINT(fmt ...) {\
    FILE *logfp = fopen(LOG_FILE , "a+");\
    if (logfp){\
        time_t s = time(NULL);\
        struct tm* current_time = localtime(&s);\
        fprintf(logfp, "[%02d:%02d:%02d] ",\
                        current_time->tm_hour,\
                        current_time->tm_min,\
                        current_time->tm_sec);\
        fprintf(logfp, fmt);\
        fclose(logfp);\
    }\
}\
```

Usage:
```
APPLY_PRINT("%s: %d, get_memory() returned %d", __FUNCTION__, __LINE__, get_memory());
```

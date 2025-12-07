#include <time.h>
#include "config/config_misc.h"
#include "rtc.h"
#include <stdbool.h>


int gRTCEnabledPopupTimer = 0;
bool gRTCEnabledJustNow = true;


// Reads current system time
void rtc_get_time(RTCInfo *rtc) {
    time_t now = time(NULL);
    struct tm *t = localtime(&now);

    rtc->year  = t->tm_year + 1900;
    rtc->month = t->tm_mon + 1;
    rtc->day   = t->tm_mday;
    rtc->hour  = t->tm_hour;
    rtc->min   = t->tm_min;
    rtc->sec   = t->tm_sec;
}

// Called once per frame
void rtc_update(RTCInfo *rtc) {
    rtc_get_time(rtc);
}

#pragma once
#ifndef RTC_H
#define RTC_H

typedef struct {
    int year;
    int month;
    int day;
    int hour;
    int min;
    int sec;
} RTCInfo;

extern RTCInfo gRTC;
extern int gRTCEnabledPopupTimer;

void rtc_get_time(RTCInfo *rtc);
void rtc_update(RTCInfo *rtc);

#endif

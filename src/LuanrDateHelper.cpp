#include "LuanrDateHelper.hpp"

LuanrDateHelper::LuanrDateHelper(QObject *parent)
    : QObject(parent)
{}

static int LuanrDateHelper::DayOfYear(int year, int month, int day){
    if(year%4==0 && (year%100!=0 || year%400==0))
        return leap_Day[month-1]+day-1;
    return normal_Day[month-1]+day-1;
}

QString LuanrDateHelper::ChangeLuanrFromSolar(int year, int month, int day){
    if(year<begin_year || year>begin_year+num_year-1)  return QString("none");

    int year_index=year-begin_year;

    int spring_festival_month=(lunar_Year[year_index] & 0x60) >> 5;
    int spring_festival_day=(lunar_Year[year_index] & 0x1f);

    int spring_festival_daysofyear=DayOfYear(year,spring_festival_month,spring_festival_day);
    int today_daysofyear=DayOfYear(year,month,day);

    int sub_days=today_daysofyear-spring_festival_daysofyear+1;

    if(sub_days<0){
        --year_index;
        if(year_index<0) return QString("none");

        spring_festival_month=(lunar_Year[year_index] & 0x60) >> 5;
        spring_festival_day=(lunar_Year[year_index] & 0x1f);

        spring_festival_daysofyear=DayOfYear(year,spring_festival_month,spring_festival_day);

        sub_days+=DayOfYear(year-1,12,31);
    }

}



#include "LunarDateHelper.hpp"

LunarDateHelper::LunarDateHelper(QObject *parent)
    : QObject(parent)
{
//    test();
}

int LunarDateHelper::DayOfYear(int year, int month, int day){
    if(year%4==0 && (year%100!=0 || year%400==0))
        return leap_Day[month-1]+day-1;
    return normal_Day[month-1]+day-1;
}

QString LunarDateHelper::changeLuanrFromSolar(int year, int month, int day){
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

        sub_days=today_daysofyear+DayOfYear(year-1,12,31)-spring_festival_daysofyear+1;
    }
    int lunar_month=1;
    for(;lunar_month<=13;++lunar_month){
        int dayinmonth=29;
        if((lunar_Year[year_index]>>(20-lunar_month))&1)
            dayinmonth=30;
        if(sub_days<=dayinmonth) break;
        else sub_days-=dayinmonth;
    }
    int leap_month=(lunar_Year[year_index]) >>20;
    if(leap_month>0 && leap_month<lunar_month) --lunar_month;
    //todo::月份 闰月

    assert(leap_month<=12);

    //......
//    return MonthName(lunar_month)+DayName(sub_days);
    return DayName(sub_days);
}

QString LunarDateHelper::MonthName(int month){
    switch(month){
    case 1: return QString("正月");
    case 2: return QString("二月");
    case 3: return QString("三月");
    case 4: return QString("四月");
    case 5: return QString("五月");
    case 6: return QString("六月");
    case 7: return QString("七月");
    case 8: return QString("八月");
    case 9: return QString("九月");
    case 10: return QString("十月");
    case 11: return QString("冬月");
    case 12: return QString("腊月");
    }
    return "";
}

QString LunarDateHelper::DayName(int day){
    switch(day){
    case 1: return QString("初一");
    case 2: return QString("初二");
    case 3: return QString("初三");
    case 4: return QString("初四");
    case 5: return QString("初五");
    case 6: return QString("初六");
    case 7: return QString("初七");
    case 8: return QString("初八");
    case 9: return QString("初九");
    case 10: return QString("初十");
    case 11: return QString("十一");
    case 12: return QString("十二");
    case 13: return QString("十三");
    case 14: return QString("十四");
    case 15: return QString("十五");
    case 16: return QString("十六");
    case 17: return QString("十七");
    case 18: return QString("十八");
    case 19: return QString("十九");
    case 20: return QString("二十");
    case 21: return QString("廿一");
    case 22: return QString("廿二");
    case 23: return QString("廿三");
    case 24: return QString("廿四");
    case 25: return QString("廿五");
    case 26: return QString("廿六");
    case 27: return QString("廿七");
    case 28: return QString("廿八");
    case 29: return QString("廿九");
    case 30: return QString("三十");
    }
    return "";
}

void LunarDateHelper::test(){
    qDebug()<<changeLuanrFromSolar(2023,2,20);
    qDebug()<<lunar_Year[2023-1901];
    qDebug()<<int((lunar_Year[2023-1901]>>20));
    qDebug()<<int((lunar_Year[2023-1901]>>(18))&1);
}



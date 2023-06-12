#include "LunarDateHelper.hpp"

LunarDateHelper::LunarDateHelper(QObject *parent)
    : QObject(parent)
{
//    test();
    lunar_festial<<"正月初一"<<"正月十五"<<"五月初五"<<"七月初七"<<"八月十五"<<"九月初九";
}

int LunarDateHelper::DayOfYear(int year, int month, int day){
    if(year%4==0 && (year%100!=0 || year%400==0))
        return leap_Day[month-1]+day-1;
    return normal_Day[month-1]+day-1;
}

QString LunarDateHelper::changeLuanrFromSolar(int year, int month, int day){
    QString festival=Calendar_Festival(month,day);
    if(!festival.isEmpty()) return festival;
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

    //todo 农历节日
    //........

    if(sub_days==1){
        if(leap_month==lunar_month-1){
            return QString("闰")+MonthName(leap_month);
        }
        if(leap_month>0 && leap_month<lunar_month){
            --lunar_month;
        }
        return MonthName(lunar_month);
    }
    assert(leap_month<=12);
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
    return QString("除夕");
}

QString LunarDateHelper::Calendar_Festival(int month, int day){
    switch(month){
        case 1: {
            switch(day){
                case 1: return QString("元旦节");
            }
            break;
        }
        case 3: {
            switch(day){
                case 8: return QString("妇女节");
            }
            break;
        }
        case 4: {
            switch(day){
                case 5: return QString("清明节");
                case 20: return QString("谷雨");
            }
            break;
        }
        case 5: {
            switch(day){
                case 1: return QString("劳动节");
                case 6: return QString("立夏");
                case 21: return QString("小满");
            }
            break;
        }
        case 6: {
            switch(day){
                case 6: return QString("芒种");
                case 22: return QString("夏至");
            }
            break;
        }
        case 7: {
            switch(day){
                case 1: return QString("建党节");
                case 23: return QString("大暑");
            }
            break;
        }
        case 8: {
            switch(day){
                case 1: return QString("建军节");
                case 8: return QString("立秋");
                case 23: return QString("处暑");
            }
            break;
        }
        case 9: {
            switch(day){
                case 8: return QString("白露");
            }
            break;
        }
        case 10: {
            switch(day){
                case 1: return QString("国庆节");
                case 8: return QString("寒露");
            }
            break;
        }
        case 11: {
            switch(day){
                case 22: return QString("小雪");
            }
            break;
        }
        case 12: {
            switch(day){
                case 7: return QString("大雪");
                case 22: return QString("冬至");
                case 25: return QString("圣诞节");
            }
            break;
        }
    }
    return "";
}

QString LunarDateHelper::Lunar_Festival(QString Date){
    switch(lunar_festial.indexOf(Date)){
        case 0: return QString("春节");
        case 1: return QString("元宵节");
        case 2: return QString("端午节");
        case 3: return QString("七夕节");
        case 4: return QString("中秋节");
        case 5: return QString("重阳节");
        default: break;
    }
    return "";
}

void LunarDateHelper::test(){
    qDebug()<<changeLuanrFromSolar(2024,2,8);
}



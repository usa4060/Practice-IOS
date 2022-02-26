//
//  CityCovidOverview.swift
//  CoronaStatus
//
//  Created by admin on 2022/02/26.
//

import Foundation


struct CityCovidOverview : Codable{
    let korea : CovidOverView
    let seoul : CovidOverView
    let busan : CovidOverView
    let daegu : CovidOverView
    let incheon : CovidOverView
    let gwangju : CovidOverView
    let daejeon : CovidOverView
    let ulsan : CovidOverView
    let sejong : CovidOverView
    let gyeonggi  : CovidOverView
    let gangwon  : CovidOverView
    let chungbuk  : CovidOverView
    let chungnam  : CovidOverView
    let jeonbuk  : CovidOverView
    let jeonnam  : CovidOverView
    let gyeongbuk  : CovidOverView
    let gyeongnam  : CovidOverView
    let jeju  : CovidOverView
}

struct CovidOverView : Codable{
    let countryName : String
    let newCase : String
    let totalCase : String
    let recovered : String
    let death : String
    let percentage : String
    let newCcase : String
    let newFcase : String
}

//
//  ServerApiCall.h
//  railpass
//
//  Created by Mehul Bhavani on 16/03/14.
//  Copyright (c) 2014 Rail Pass / Synapsys Technosolutions Tech. All rights reserved.
//


// Api Names
#define App_startup                       @"App.startup"
#define App_sync                          @"App.sync"

#define Devices_savePushToken             @"Devices.savePushToken"

#define Ticket_scan                       @"Ticket.scan"
#define Ticket_addByPNR                   @"Ticket.addByPNR"
#define Ticket_getAllTickets              @"Ticket.getAllTickets"
#define Ticket_getTicket                  @"Ticket.getTicket"
#define Ticket_refreshPNRStatus           @"Ticket.refreshPNRStatus"
#define Ticket_remove                     @"Ticket.remove"
#define Ticket_addBySMS                   @"Ticket.addBySMS"
#define Ticket_addByPNRRaw                @"Ticket.addByPNRRaw"                 //data from railway server

#define Train_getTrain                    @"Train.getTrain"
#define Train_getRouteForTrain            @"Train.getRouteForTrain"
#define Train_getTrainWithRouteToCache    @"Train.getTrainWithRouteToCache"
#define Train_getCancelledTrains          @"Train.getCancelledTrains"
#define Train_getPartiallyCancelledTrains @"Train.getPartiallyCancelledTrains"
#define Train_getRescheduledTrains        @"Train.getRescheduledTrains"
#define Train_getDivertedTrains           @"Train.getDivertedTrains"

#define Station_getStation                @"Station.getStation"

#define User_saveAccounts                 @"User.saveAccounts"

#define Journey_getStatus                 @"Journey.getStatus"

#define Enquiry_getTrainsBetweenStations  @"Enquiry.getTrainsBetweenStations"
#define Enquiry_getSeatAvailability       @"Enquiry.getSeatAvailability"        //direct/ data from railway server
#define Enquiry_getFare                   @"Enquiry.getFare"                    //direct/ data from railway server


#import <Foundation/Foundation.h>

@interface ServerApiCall : NSObject

@property (nonatomic, retain) NSString *apiName;
@property (nonatomic, retain) NSMutableDictionary *apiParams;

@end

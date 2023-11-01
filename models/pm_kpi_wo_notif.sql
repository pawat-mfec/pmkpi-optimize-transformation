{{ config(materialized='table') }}

SELECT
SAFE_CAST(Replace(notification,' ','') as int64)     AS notification_int ,
SAFE_CAST(Replace(workorder,' ','') as int64)    AS workorder_int ,
DATE(snapshotdatetime, 'Asia/Kuala_Lumpur')  AS snapshotdate ,

Notif.* ,

DATETIME(notificationdate, IFNULL(notificationtime,TIME'00:00:00'))   AS notificationdatetime ,
DATETIME(wocreateddate, IFNULL(wocreatedtime,TIME'00:00:00'))     AS wocreateddatetime ,
DATETIME(woscheduledstartdate, IFNULL(woscheduledstarttime,TIME'00:00:00'))   AS woscheduledstartdatetime ,
DATETIME(woscheduledfinishdate, IFNULL(woscheduledfinishtime,TIME'00:00:00'))     AS woscheduledfinishdatetime ,

TRIM( CONCAT(
    CASE WHEN Notif.NotifStatusOutstandingNotification LIKE "X" THEN "OSNO" ELSE " " END, "",
    CASE WHEN Notif.NotifStatusNotificationPostponed LIKE "X" THEN "NOPO" ELSE " " END, "",
    CASE WHEN Notif.NotifStatusNotificationInProcess LIKE "X" THEN "NOPR" ELSE " " END, "",
    CASE WHEN Notif.NotifStatusOrderAssigned LIKE "X" THEN "ORAS" ELSE " " END, " ",
    CASE WHEN Notif.NotifStatusNotificationCompleted LIKE "X" THEN "NOCO" ELSE " " END,"",
    CASE WHEN Notif.NotifStatusDeletionFlag LIKE "X" THEN "DLFL" ELSE""END,"",
    CASE WHEN Notif.NotifStatusApprovalRefused LIKE "X" THEN "APRF" ELSE " " END, " ",
    CASE WHEN Notif.NotifStatusApprovalRequired LIKE "X" THEN "APRQ" ELSE " " END, " ",
    CASE WHEN Notif.NotifStatusApprovalOK LIKE "X" THEN "APOK" ELSE " " END, " "
) ) AS notifstatus ,

TRIM( CONCAT(
    CASE WHEN Notif.notifstatusothers LIKE "X" THEN "OTHERS" ELSE " " END, " ",
    CASE WHEN Notif.NotifStateRejected LIKE "X" THEN "REJECT" ELSE " " END, " ",
    CASE WHEN Notif.NotifStatePendingApproval LIKE "X" THEN "PDAPPR" ELSE " " END, " ",
    CASE WHEN Notif.NotifStatePendingWorkOrderCreation LIKE "X" THEN "PDWOCRT" ELSE " " END, " ",
    CASE WHEN Notif.NotifStatePendingClose LIKE "X" THEN "PDCLSE" ELSE " " END, " ",
    CASE WHEN Notif.NotifStateCompleted LIKE "X" THEN "COMPLT" ELSE " " END, " ",
    CASE WHEN Notif.NotifStateDeletionFlag LIKE "X" THEN "DLFL" ELSE " " END, " "
) ) AS notifstate ,

TRIM( CONCAT(
    CASE WHEN Notif.WOPhaseOrderCreated LIKE "X" THEN "CRTD" ELSE " " END, " ",
    CASE WHEN Notif.WOPhaseOrderReleased LIKE "X" THEN "REL" ELSE " " END, " ",
    CASE WHEN Notif.WOPhaseOrderCompleted LIKE "X" THEN "COMP" ELSE " " END, " ",
    CASE WHEN Notif.WOPhaseOrderClosed LIKE "X" THEN "CLSD" ELSE " " END, " ",
    CASE WHEN Notif.WOPhaseOrderExecutedPendingCompletion LIKE "X" THEN "EXEC" ELSE " " END, " "
) ) AS wophase ,

TRIM( CONCAT(
    CASE WHEN Notif.WOStatusPartiallyConfirmed LIKE "X" THEN "PCNF" ELSE " " END, " ",
    CASE WHEN Notif.WOStatusClosed LIKE "X" THEN "CLSD" ELSE " " END, " ",
    CASE WHEN Notif.WOStatusConfirmed LIKE "X" THEN "CNF" ELSE " " END, " ",
    CASE WHEN Notif.WOStatusCreated LIKE "X" THEN "CRTD" ELSE " " END, " ",
    CASE WHEN Notif.WOStatusDeletionFlag LIKE "X" THEN "DLFL" ELSE " " END, " ",
    CASE WHEN Notif.WOStatusNotCompleted LIKE "X" THEN "NCMP" ELSE " " END, " ",
    CASE WHEN Notif.WOStatusReleased LIKE "X" THEN "REL" ELSE " " END, " ",
    CASE WHEN Notif.WOStatusReleaseRejected LIKE "X" THEN "RELR" ELSE " " END, " ",
    CASE WHEN Notif.WOStatusTechnicallyCompleted LIKE "X" THEN "TECO" ELSE " " END, " "
) ) AS wostatus ,

TRIM( CONCAT(
    CASE WHEN Notif.UStatusEngrReviewReq LIKE "X" THEN "CENG" ELSE " " END, " ",
    CASE WHEN Notif.UStatusMOCReviewReq LIKE "X" THEN "CMOC" ELSE " " END, " ",
    CASE WHEN Notif.UStatusCancelled LIKE "X" THEN "CNCL" ELSE " " END, " ",
    CASE WHEN Notif.UStatusPendSOW LIKE "X" THEN "CQUO" ELSE " " END, " ",
    CASE WHEN Notif.UStatusReplan LIKE "X" THEN "CRPL" ELSE " " END, " ",
    CASE WHEN Notif.UStatusPendExtServices LIKE "X" THEN "REXT" ELSE " " END, " ",
    CASE WHEN Notif.UStatusPendIntExecution LIKE "X" THEN "RINT" ELSE " " END, " ",
    CASE WHEN Notif.UStatusPendDirectPurchDeliv LIKE "X" THEN "RNST" ELSE " " END, " ",
    CASE WHEN Notif.UStatusPendScheduling LIKE "X" THEN "RSCH" ELSE " " END, " ",
    CASE WHEN Notif.UStatusPendStockReplen LIKE "X" THEN "RMRP" ELSE " " END, " ",
    CASE WHEN Notif.UStatusPendBid_Contractr LIKE "X" THEN "RBID" ELSE " " END, " ",
    CASE WHEN Notif.UStatusPendStockDelivery LIKE "X" THEN "RSDL" ELSE " " END, " ",
    CASE WHEN Notif.UStatusInProcessing LIKE "X" THEN "INPN" ELSE " " END, " ",
    CASE WHEN Notif.UStatusInitial LIKE "X" THEN "INIT" ELSE " " END, " ",
    CASE WHEN Notif.UStatusHold LIKE "X" THEN "HOLD" ELSE " " END, " ",
    CASE WHEN Notif.UStatusCompleted LIKE "X" THEN "COMP" ELSE " " END, " ",
    CASE WHEN Notif.UStatusSchdAIP LIKE "X" THEN "SAIP" ELSE " " END, " ",
    CASE WHEN Notif.UStatusPendWOR LIKE "X" THEN "CWOR" ELSE " " END, " ",
    CASE WHEN Notif.UStatusPendWOP LIKE "X" THEN "CWOP" ELSE " " END, " ",
    CASE WHEN Notif.UStatusPendSTR LIKE "X" THEN "CSTR" ELSE " " END, " ",
    CASE WHEN Notif.UStatusPendTER LIKE "X" THEN "CTER" ELSE " " END, " ",
    CASE WHEN Notif.UStatusPendSPF LIKE "X" THEN "CSPF" ELSE " " END, " ",
    CASE WHEN Notif.UStatusPendCER LIKE "X" THEN "CCER" ELSE " " END, " "
) ) AS woustatus ,

CASE
    WHEN notiffunctionallocation is Null OR trim(notiffunctionallocation) in ('null','') THEN Null  --Revise 20201212
    when substr(notiffunctionallocation, 0, 3) = 'MUR'
    THEN CASE
        when length(notiffunctionallocation) > 16 then substr(notiffunctionallocation, 17, 4)
        when length(notiffunctionallocation) > 10 THEN substr(notiffunctionallocation, 8, 8) --XXX Adjust from 17, 4 XXX
        else substr(notiffunctionallocation, 5, 2)
    END
    ELSE substr(notiffunctionallocation, 1, 4)
END as notifplatform ,


CASE
    WHEN WOFunctionalLocation is Null OR trim(WOFunctionalLocation) in ('null','') THEN NULL        --Revise 20201212
    WHEN substr(WOFunctionalLocation, 0, 3) = 'MUR'
    THEN CASE
        WHEN length(WOFunctionalLocation) > 16 THEN substr(WOFunctionalLocation, 17, 4)
        WHEN length(WOFunctionalLocation) > 10 THEN substr(WOFunctionalLocation, 8, 8)
        ELSE substr(WOFunctionalLocation, 5, 2)
    END
    ELSE substr(WOFunctionalLocation, 1, 4)
END woplatform

FROM (
    SELECT
    ingestion_tsp    AS snapshotdatetime ,
    SAPClient    AS sapclient ,
    NotificationKey  AS notificationkey ,
    WorkOrderKey     AS workorderkey ,
    Notification     AS notification ,
    NotificationDesc     AS notificationdesc ,
    NotificationType     AS notificationtype ,
    NotificationTypeDesc     AS notificationtypedesc ,
    WorkOrder    AS workorder ,
    WorkOrderDesc    AS workorderdesc ,
    NotifFunctionalLocation  AS notiffunctionallocation ,
    NotifEquipmentNum    AS notifequipmentnum ,
    NotifAssembly    AS notifassembly ,
    NotifAssemblyDesc    AS notifassemblydesc ,
    NotifCoding  AS notifcoding ,
    NotifCodeGroup   AS notifcodegroup ,
    NotifPlannerGroup    AS notifplannergroup ,
    NotifPlannerGroupDesc    AS notifplannergroupdesc ,
    NotifPlanningPlant   AS notifplanningplant ,
    NotifPlanningPlantDesc   AS notifplanningplantdesc ,
    NotifMainWorkCenter  AS notifmainworkcenter ,
    NotifMainWorkCenterDesc  AS notifmainworkcenterdesc ,
    SAFE_CAST(NotifRequiredStartDate AS DATE)    AS notifrequiredstartdate ,
    SAFE_CAST(NotifRequiredEndDate AS DATE)  AS notifrequiredenddate ,
    NotifPriorityCode    AS notifprioritycode ,
    NotifPriority    AS notifpriority ,
    NotifRevision    AS notifrevision ,
    NotifBreakdown   AS notifbreakdown ,
    SAFE_CAST(NotifMalfunctionStartDate AS DATE)     AS notifmalfunctionstartdate ,
    SAFE_CAST(NotifMalfunctionEndDate AS DATE)   AS notifmalfunctionenddate ,
    NotifBreakdownDurationUnit   AS notifbreakdowndurationunit ,
    NotifMaintenancePlant    AS notifmaintenanceplant ,
    NotifMaintenancePlantDesc    AS notifmaintenanceplantdesc ,
    NotifLocation    AS notiflocation ,
    NotifRoom    AS notifroom ,
    NotifPlantSection    AS notifplantsection ,
    NotifWorkCenter  AS notifworkcenter ,
    NotifWorkCenterDesc  AS notifworkcenterdesc ,
    NotifABC_Indicator   AS notifabc_indicator ,
    NotifSortField   AS notifsortfield ,
    NotifCompanyCodeKey  AS notifcompanycodekey ,
    NotifCompanyCode     AS notifcompanycode ,
    NotifAsset   AS notifasset ,
    NotifBusinessArea    AS notifbusinessarea ,
    NotifCostCenter  AS notifcostcenter ,
    NotifCostCenterKey   AS notifcostcenterkey ,
    NotifCostCenterDesc  AS notifcostcenterdesc ,
    NotifControllingArea     AS notifcontrollingarea ,
    NotifWBS_Element     AS notifwbs_element ,
    NotifWBS_ElementDesc     AS notifwbs_elementdesc ,
    NotifSettlementOrder     AS notifsettlementorder ,
    NotifReportedBy  AS notifreportedby ,
    SAFE_CAST(NotificationDate AS DATE)  AS notificationdate ,
    NotificationTime     AS notificationtime_str ,
    CASE WHEN SAFE_CAST(notificationtime as INT64) is not null and length(notificationtime) = 6
        THEN PARSE_TIME('%H%M%S', notificationtime)
        ELSE NULL
    END    AS notificationtime ,
    SAFE_CAST(NotifCompletionDate AS DATE)   AS notifcompletiondate ,
    SAFE_CAST(NotifReferenceDate AS DATE)    AS notifreferencedate ,
    NotifTechInspectionBy    AS notiftechinspectionby ,
    SAFE_CAST(NotifTechInspectionDate AS DATE)   AS notiftechinspectiondate ,
    NotifCreatedByUID    AS notifcreatedbyuid ,
    NotifCreatedByName   AS notifcreatedbyname ,
    SAFE_CAST(NotifCreatedDate AS DATE)  AS notifcreateddate ,
    NotifStatusOutstandingNotification   AS notifstatusoutstandingnotification ,
    NotifStatusNotificationPostponed     AS notifstatusnotificationpostponed ,
    NotifStatusNotificationInProcess     AS notifstatusnotificationinprocess ,
    NotifStatusOrderAssigned     AS notifstatusorderassigned ,
    NotifStatusNotificationCompleted     AS notifstatusnotificationcompleted ,
    NotifStatusDeletionFlag  AS notifstatusdeletionflag ,
    NotifStatusApprovalRefused   AS notifstatusapprovalrefused ,
    NotifStatusOthers    AS notifstatusothers ,
    NotifStateRejected   AS notifstaterejected ,
    NotifStatePendingApproval    AS notifstatependingapproval ,
    NotifStatePendingWorkOrderCreation   AS notifstatependingworkordercreation ,
    NotifStatePendingClose   AS notifstatependingclose ,
    NotifStateCompleted  AS notifstatecompleted ,
    NotifStateDeletionFlag   AS notifstatedeletionflag ,
    NotifStatusApprovalRequired  AS notifstatusapprovalrequired ,
    NotifStatusApprovalOK    AS notifstatusapprovalok ,
    SAFE_CAST(NotifStatusApprovalRequiredDate AS DATE)   AS notifstatusapprovalrequireddate ,
    SAFE_CAST(NotifStatusApprovalOKDate AS DATE)     AS notifstatusapprovalokdate ,
    SAFE_CAST(NotifStatusOutstandingNotificationDate AS DATE)    AS notifstatusoutstandingnotificationdate ,
    SAFE_CAST(NotifStatusNotificationPostponedDate AS DATE)  AS notifstatusnotificationpostponeddate ,
    SAFE_CAST(NotifStatusNotificationInProcessDate AS DATE)  AS notifstatusnotificationinprocessdate ,
    SAFE_CAST(NotifStatusOrderAssignedDate AS DATE)  AS notifstatusorderassigneddate ,
    SAFE_CAST(NotifStatusNotificationCompletedDate AS DATE)  AS notifstatusnotificationcompleteddate ,
    SAFE_CAST(NotifStatusDeletionFlagDate AS DATE)   AS notifstatusdeletionflagdate ,
    SAFE_CAST(NotifStatusApprovalRefusedDate AS DATE)    AS notifstatusapprovalrefuseddate ,
    OrderType    AS ordertype ,
    OrderTypeDesc    AS ordertypedesc ,
    WOPlannerGroup   AS woplannergroup ,
    WOPlannerGroupDesc   AS woplannergroupdesc ,
    WOPlanningPlant  AS woplanningplant ,
    WOPlanningPlantDesc  AS woplanningplantdesc ,
    WOMainWorkCenter     AS womainworkcenter ,
    WOMainWorkCenterDesc     AS womainworkcenterdesc ,
    WOMaintenanceActivityType    AS womaintenanceactivitytype ,
    WOMaintenanceActivityTypeDesc    AS womaintenanceactivitytypedesc ,
    SAFE_CAST(WOBasicStartDate AS DATE)  AS wobasicstartdate ,
    SAFE_CAST(WOBasicFinishDate AS DATE)     AS wobasicfinishdate ,
    SAFE_CAST(WOScheduledStartDate AS DATE)  AS woscheduledstartdate ,
    SAFE_CAST(WOScheduledFinishDate AS DATE)     AS woscheduledfinishdate ,
    WORevision   AS worevision ,
    SAFE_CAST(WOReferenceDate AS DATE)   AS woreferencedate ,
    WOFunctionalLocation     AS wofunctionallocation ,
    WOFunctionalLocationDesc     AS wofunctionallocationdesc ,
    WOEquipmentNum   AS woequipmentnum ,
    WOEquipmentDesc  AS woequipmentdesc ,
    WOEquipmentTechID    AS woequipmenttechid ,
    WOAssembly   AS woassembly ,
    WOAssemblyDesc   AS woassemblydesc ,
    WOCompanyCodeKey     AS wocompanycodekey ,
    WOCompanyCode    AS wocompanycode ,
    WOCompanyCodeDesc    AS wocompanycodedesc ,
    WOBusinessArea   AS wobusinessarea ,
    WOControllingArea    AS wocontrollingarea ,
    WOProfitCenter   AS woprofitcenter ,
    WOProfitCenterDesc   AS woprofitcenterdesc ,
    WOFunctionalArea     AS wofunctionalarea ,
    WOFunctionalAreaDesc     AS wofunctionalareadesc ,
    WOMaintenancePlant   AS womaintenanceplant ,
    WOMaintenancePlantDesc   AS womaintenanceplantdesc ,
    WOLocation   AS wolocation ,
    WORoom   AS woroom ,
    WOPlantSection   AS woplantsection ,
    WOWBS_Element    AS wowbs_element ,
    WOWBS_ElementDesc    AS wowbs_elementdesc ,
    WOEmergencyInd   AS woemergencyind ,
    WOPlanningIndicator  AS woplanningindicator ,
    SAFE_CAST(WOReleaseDate AS DATE)     AS woreleasedate ,
    SAFE_CAST(WOCloseDate AS DATE)   AS woclosedate ,
    WOPhaseOrderCreated  AS wophaseordercreated ,
    WOPhaseOrderReleased     AS wophaseorderreleased ,
    WOPhaseOrderCompleted    AS wophaseordercompleted ,
    WOPhaseOrderClosed   AS wophaseorderclosed ,
    WOPhaseOrderExecutedPendingCompletion    AS wophaseorderexecutedpendingcompletion ,
    SAFE_CAST(WOActualStartDate AS DATE)     AS woactualstartdate ,
    SAFE_CAST(WOActualFinishDate AS DATE)    AS woactualfinishdate ,
    WORespCostCenter     AS worespcostcenter ,
    SAFE_CAST(WOCreatedDate AS DATE)     AS wocreateddate ,
    WOCreatedByUID   AS wocreatedbyuid ,
    WOCreatedByName  AS wocreatedbyname ,
    SAFE_CAST(WOChangedDate AS DATE)     AS wochangeddate ,
    WOChangedByUID   AS wochangedbyuid ,
    WOChangedByName  AS wochangedbyname ,
    SAFE_CAST(WOTECODate AS DATE)    AS wotecodate ,
    WOCostCenterHierarchy    AS wocostcenterhierarchy ,
    WOCostCenterKey  AS wocostcenterkey ,
    WOCostCenter     AS wocostcenter ,
    WOCostCenterDesc     AS wocostcenterdesc ,
    WOStatusClosed   AS wostatusclosed ,
    WOStatusConfirmed    AS wostatusconfirmed ,
    WOStatusCreated  AS wostatuscreated ,
    WOStatusDeletionFlag     AS wostatusdeletionflag ,
    WOStatusNotCompleted     AS wostatusnotcompleted ,
    WOStatusReleased     AS wostatusreleased ,
    WOStatusReleaseRejected  AS wostatusreleaserejected ,
    WOStatusTechnicallyCompleted     AS wostatustechnicallycompleted ,
    WOPriority   AS wopriority ,
    WOPriorityCode   AS woprioritycode ,
    SAFE_CAST(WOObjectList AS INT64)     AS woobjectlist ,
    OrderCurrency    AS ordercurrency ,
    WorkOrderIndicator   AS workorderindicator ,
    NotificationIndicator    AS notificationindicator ,
    NotifFunctionalLocationDesc  AS notiffunctionallocationdesc ,
    NotifEquipmentDesc   AS notifequipmentdesc ,
    SAFE_CAST(ODDDate AS DATE)   AS odddate ,
    UStatusAFEReviewReq  AS ustatusafereviewreq ,
    UStatusEngrReviewReq     AS ustatusengrreviewreq ,
    UStatusMOCReviewReq  AS ustatusmocreviewreq ,
    UStatusCancelled     AS ustatuscancelled ,
    UStatusPendMMCreation    AS ustatuspendmmcreation ,
    UStatusPendSOW   AS ustatuspendsow ,
    UStatusReplan    AS ustatusreplan ,
    UStatusPendSupApproval   AS ustatuspendsupapproval ,
    UStatusPendDocCloseOut   AS ustatuspenddoccloseout ,
    UStatusPendExtServices   AS ustatuspendextservices ,
    UStatusPendIntExecution  AS ustatuspendintexecution ,
    UStatusPendPlanning  AS ustatuspendplanning ,
    UStatusPendDirectPurchDeliv  AS ustatuspenddirectpurchdeliv ,
    UStatusPendScheduling    AS ustatuspendscheduling ,
    UStatusPendStockReplen   AS ustatuspendstockreplen ,
    UStatusPendBid_Contractr     AS ustatuspendbid_contractr ,
    UStatusPendStockDelivery     AS ustatuspendstockdelivery ,
    UStatusInProcessing  AS ustatusinprocessing ,
    UStatusInitial   AS ustatusinitial ,
    UStatusHold  AS ustatushold ,
    UStatusCompleted     AS ustatuscompleted ,
    SAFE_CAST(LDDDate AS DATE)   AS ldddate ,
    SAFE_CAST(WOScheduledStartTime AS TIME)  AS woscheduledstarttime ,
    SAFE_CAST(WOScheduledFinishTime AS TIME)     AS woscheduledfinishtime ,
    SAFE_CAST(WOCreatedTime AS TIME)     AS wocreatedtime ,
    WOStatusPartiallyConfirmed   AS wostatuspartiallyconfirmed ,
    WOUStatusProfile     AS woustatusprofile ,
    SAFE_CAST(WOStatusPartiallyConfirmedDate AS DATE)    AS wostatuspartiallyconfirmeddate ,
    SAFE_CAST(WOStatusConfirmedDate AS DATE)     AS wostatusconfirmeddate ,
    SAFE_CAST(WOStatusDeletionFlagDate AS DATE)  AS wostatusdeletionflagdate ,
    SAFE_CAST(WOStatusNotCompletedDate AS DATE)  AS wostatusnotcompleteddate ,
    SAFE_CAST(WOStatusReleaseRejectedDate AS DATE)   AS wostatusreleaserejecteddate ,
    SAFE_CAST(UStatusAFEReviewReqDate AS DATE)   AS ustatusafereviewreqdate ,
    SAFE_CAST(UStatusEngrReviewReqDate AS DATE)  AS ustatusengrreviewreqdate ,
    SAFE_CAST(UStatusMOCReviewReqDate AS DATE)   AS ustatusmocreviewreqdate ,
    SAFE_CAST(UStatusCancelledDate AS DATE)  AS ustatuscancelleddate ,
    SAFE_CAST(UStatusPendMMCreationDate AS DATE)     AS ustatuspendmmcreationdate ,
    SAFE_CAST(UStatusPendSOWDate AS DATE)    AS ustatuspendsowdate ,
    SAFE_CAST(UStatusReplanDate AS DATE)     AS ustatusreplandate ,
    SAFE_CAST(UStatusPendSupApprovalDate AS DATE)    AS ustatuspendsupapprovaldate ,
    SAFE_CAST(UStatusPendDocCloseOutDate AS DATE)    AS ustatuspenddoccloseoutdate ,
    SAFE_CAST(UStatusPendExtServicesDate AS DATE)    AS ustatuspendextservicesdate ,
    SAFE_CAST(UStatusPendIntExecutionDate AS DATE)   AS ustatuspendintexecutiondate ,
    SAFE_CAST(UStatusPendPlanningDate AS DATE)   AS ustatuspendplanningdate ,
    SAFE_CAST(UStatusPendDirectPurchDelivDate AS DATE)   AS ustatuspenddirectpurchdelivdate ,
    SAFE_CAST(UStatusPendSchedulingDate AS DATE)     AS ustatuspendschedulingdate ,
    SAFE_CAST(UStatusPendStockReplenDate AS DATE)    AS ustatuspendstockreplendate ,
    SAFE_CAST(UStatusPendBid_ContractrDate AS DATE)  AS ustatuspendbid_contractrdate ,
    SAFE_CAST(UStatusPendStockDeliveryDate AS DATE)  AS ustatuspendstockdeliverydate ,
    SAFE_CAST(UStatusInProcessingDate AS DATE)   AS ustatusinprocessingdate ,
    SAFE_CAST(UStatusInitialDate AS DATE)    AS ustatusinitialdate ,
    SAFE_CAST(UStatusHoldDate AS DATE)   AS ustatusholddate ,
    SAFE_CAST(UStatusCompletedDate AS DATE)  AS ustatuscompleteddate ,
    UStatusSchdAIP   AS ustatusschdaip ,
    UStatusPendWOR   AS ustatuspendwor ,
    UStatusPendWOP   AS ustatuspendwop ,
    UStatusPendSTR   AS ustatuspendstr ,
    UStatusPendTER   AS ustatuspendter ,
    UStatusPendSPF   AS ustatuspendspf ,
    UStatusPendCER   AS ustatuspendcer ,
    SAFE_CAST(UStatusSchdAIPDate AS DATE)    AS ustatusschdaipdate ,
    SAFE_CAST(UStatusPendWORDate AS DATE)    AS ustatuspendwordate ,
    SAFE_CAST(UStatusPendWOPDate AS DATE)    AS ustatuspendwopdate ,
    SAFE_CAST(UStatusPendSTRDate AS DATE)    AS ustatuspendstrdate ,
    SAFE_CAST(UStatusPendTERDate AS DATE)    AS ustatuspendterdate ,
    SAFE_CAST(UStatusPendSPFDate AS DATE)    AS ustatuspendspfdate ,
    SAFE_CAST(UStatusPendCERDate AS DATE)    AS ustatuspendcerdate ,
    SAFE_CAST(NotificationCount AS INT64)    AS notificationcount ,
    SAFE_CAST(BreakdownDurationHRS AS NUMERIC)   AS breakdowndurationhrs ,
    SAFE_CAST(NotifNumberOfProcessingDays AS INT64)  AS notifnumberofprocessingdays ,
    SAFE_CAST(NotifPendingApprovalAgingDays AS INT64)    AS notifpendingapprovalagingdays ,
    SAFE_CAST(NotifPendingCloseAgingDays AS INT64)   AS notifpendingcloseagingdays ,
    SAFE_CAST(WOCount AS INT64)  AS wocount ,
    SAFE_CAST(EstimatedCostOrderCur AS NUMERIC)  AS estimatedcostordercur ,
    SAFE_CAST(EstimatedCostUSD AS NUMERIC)   AS estimatedcostusd ,
    SAFE_CAST(PlannedCostOrderCur AS NUMERIC)    AS plannedcostordercur ,
    SAFE_CAST(PlannedCostUSD AS NUMERIC)     AS plannedcostusd ,
    SAFE_CAST(ActualCostOrderCur AS NUMERIC)     AS actualcostordercur ,
    SAFE_CAST(ActualCostUSD AS NUMERIC)  AS actualcostusd ,
    SAFE_CAST(WOPendingReleaseAging AS INT64)    AS wopendingreleaseaging ,
    SAFE_CAST(WOPendingTECOAging AS INT64)   AS wopendingtecoaging ,
    SAFE_CAST(NotiftoWOCreationDays AS INT64)    AS notiftowocreationdays ,
    SAFE_CAST(WOObjectListCount AS INT64)    AS woobjectlistcount

    FROM
        `gcp-my-th-it-prd.sz_hana_hana.zcv_pm_notification_and_work_order`
) Notif

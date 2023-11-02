SET TIME ZONE 'Asia/Kuala_Lumpur';
SELECT
  *,
  CASE
    WHEN Platform IN ('BESA', 'GOPA', 'GOPB', 'GORA', 'MEPA', 'PESA', 'SNAA', 'SNPA') THEN 'Southern'
    WHEN Platform='SB1-000K' THEN 'SB1-000K'
    WHEN Platform='SK1-0309' THEN 'SK1-0309'
    WHEN Platform='SK1-0311' THEN 'SK1-0311'
    WHEN Platform IN ('FPSO', 'KDTU', 'KIKS', 'SNPS') THEN 'Sabah'
    WHEN Platform='MGP1' THEN 'BORF'
    WHEN Platform IN ('PRPA', 'SAAA', 'SAPA', 'SASA', 'SEPA') THEN 'Northern'
    WHEN Platform IN ('PTSA','WPFA','WPIA','WPPA','WPPB','WPTB','PLEM','PLET') THEN 'Central'
    WHEN Platform='MY' THEN 'MY'
    WHEN (Platform='null')
  OR (Platform IS NULL) THEN NULL
  ELSE
  NULL
END
  AS Hub,
  CASE
    WHEN notifPlatform IN ('BESA', 'GOPA', 'GOPB', 'GORA', 'MEPA', 'PESA', 'SNAA', 'SNPA') THEN 'Southern'
    WHEN notifPlatform='SB1-000K' THEN 'SB1-000K'
    WHEN notifPlatform='SK1-0309' THEN 'SK1-0309'
    WHEN notifPlatform='SK1-0311' THEN 'SK1-0311'
    WHEN notifPlatform IN ('FPSO', 'KDTU', 'KIKS', 'SNPS') THEN 'Sabah'
    WHEN notifPlatform='MGP1' THEN 'BORF'
    WHEN notifPlatform IN ('PRPA', 'SAAA', 'SAPA', 'SASA', 'SEPA') THEN 'Northern'
    WHEN notifPlatform IN ('PTSA','WPFA','WPIA','WPPA','WPPB','WPTB','PLEM','PLET') THEN 'Central'
    WHEN notifPlatform='MY' THEN 'MY'
    WHEN (notifPlatform='null')
  OR (notifPlatform IS NULL) THEN NULL
  ELSE
  NULL
END
  AS notifHub,
  CASE
    WHEN WOPlatform IN ('BESA', 'GOPA', 'GOPB', 'GORA', 'MEPA', 'PESA', 'SNAA', 'SNPA') THEN 'Southern'
    WHEN WOPlatform='SB1-000K' THEN 'SB1-000K'
    WHEN WOPlatform='SK1-0309' THEN 'SK1-0309'
    WHEN WOPlatform='SK1-0311' THEN 'SK1-0311'
    WHEN WOPlatform IN ('FPSO', 'KDTU', 'KIKS', 'SNPS') THEN 'Sabah'
    WHEN WOPlatform='MGP1' THEN 'BORF'
    WHEN WOPlatform IN ('PRPA', 'SAAA', 'SAPA', 'SASA', 'SEPA') THEN 'Northern'
    WHEN WOPlatform IN ('PTSA','WPFA','WPIA','WPPA','WPPB','WPTB','PLEM','PLET') THEN 'Central'
    WHEN WOPlatform='MY' THEN 'MY'
    WHEN (WOPlatform='null')
  OR (WOPlatform IS NULL) THEN NULL
  ELSE
  NULL
END
  AS WOHub,
  CASE
    WHEN WOPlatform IN ('BESA', 'GOPA', 'GOPB', 'GORA', 'MEPA', 'PESA', 'SNAA', 'SNPA') OR WOPlatform IN ('PTSA', 'WPFA', 'WPIA', 'WPPA', 'WPPB', 'WPTB', 'PLEM', 'PLET') OR (WOPlatform='SK1-0309') OR (WOPlatform='MGP1') THEN 'Block 309'
    WHEN WOPlatform IN ('FPSO','KDTU','KIKS','SNPS')
  OR (WOPlatform='SB1-000K') THEN 'Block K'
    WHEN WOPlatform IN ('PRPA', 'SAAA', 'SAPA', 'SASA', 'SEPA') OR (WOPlatform='SK1-0311') THEN 'Block 311'
    WHEN WOPlatform='MY' THEN 'MY'
  ELSE
  NULL
END
  AS WOBlock,
  CASE
    WHEN NotifPlannerGroup IN ( 'P11', 'P12', 'P13', 'P14', 'P10' ) THEN 'P10 : Facilities Planner'
    WHEN NotifPlannerGroup = 'H01' THEN 'H01 : HSE'
    WHEN NotifPlannerGroup = 'I01' THEN 'I01 : Asset Integrity'
    WHEN NotifPlannerGroup IN ( 'P01','P02','P03','P04','P00' ) THEN 'P00 : Maint Planner'
    WHEN NotifPlannerGroup IN ( 'P06', 'P07', 'P08', 'P09', 'P05' ) THEN 'P05 : Operations Planner'
    WHEN NotifPlannerGroup = 'P20' THEN 'P20 : Subsea Planner'
    WHEN NotifPlannerGroup = 'P21' THEN 'P21 : Subsea Breakdw'
    WHEN NotifPlannerGroup = 'P22' THEN 'P22 : Subsea Prevent'
    WHEN NotifPlannerGroup = 'P24' THEN 'P24 : SubseaRefurb'
    WHEN NotifPlannerGroup = 'P26' THEN 'P26 : Subsea Capital'
  ELSE
  'Others'
END
  AS notifPlannerGroup_Desc,
  CASE
    WHEN WOPlannerGroup IN ( 'P11', 'P12', 'P13', 'P14', 'P10' ) THEN 'P10 : Facilities Planner'
    WHEN WOPlannerGroup = 'H01' THEN 'H01 : HSE'
    WHEN WOPlannerGroup = 'I01' THEN 'I01 : Asset Integrity'
    WHEN WOPlannerGroup IN ( 'P01','P02','P03','P04','P00' ) THEN 'P00 : Maint Planner'
    WHEN WOPlannerGroup IN ( 'P06', 'P07', 'P08', 'P09', 'P05' ) THEN 'P05 : Operations Planner'
    WHEN WOPlannerGroup = 'P20' THEN 'P20 : Subsea Planner'
    WHEN WOPlannerGroup = 'P21' THEN 'P21 : Subsea Breakdw'
    WHEN WOPlannerGroup = 'P22' THEN 'P22 : Subsea Prevent'
    WHEN WOPlannerGroup = 'P24' THEN 'P24 : SubseaRefurb'
    WHEN WOPlannerGroup = 'P26' THEN 'P26 : Subsea Capital'
  ELSE
  'Others'
END
  AS WOPlannerGroup_Desc,
  CASE
    WHEN (notifmainworkcenter = 'null' AND notifmainworkcenterdesc = 'null') OR (notifmainworkcenter IS NULL AND notifmainworkcenterdesc IS NULL) THEN NULL
    WHEN notifmainworkcenter = 'null'
  OR notifmainworkcenter IS NULL THEN notifmainworkcenterdesc
    WHEN notifmainworkcenterdesc = 'null' OR notifmainworkcenterdesc IS NULL THEN notifmainworkcenter
  ELSE
  CONCAT(notifmainworkcenter,' : ', notifmainworkcenterdesc)
END
  AS notifMainWorkCenter_Desc,
  CASE
    WHEN (woMainWorkCenterDesc ='null' AND woMainWorkCenter='null') OR (woMainWorkCenterDesc IS NULL AND woMainWorkCenter IS NULL) THEN NULL
    WHEN woMainWorkCenterDesc = 'null'
  OR woMainWorkCenterDesc IS NULL THEN woMainWorkCenter
    WHEN woMainWorkCenter='null' OR woMainWorkCenter IS NULL THEN woMainWorkCenterDesc
  ELSE
  CONCAT(woMainWorkCenter,' : ',woMainWorkCenterDesc)
END
  AS woMainWorkCenter_Desc,
  CASE
    WHEN (criticalitydesc ='null' AND criticality='null') OR (criticalitydesc IS NULL AND criticality IS NULL) THEN NULL
    WHEN criticalitydesc = 'null'
  OR criticalitydesc IS NULL THEN criticality
    WHEN criticality='null' OR criticality IS NULL THEN criticalitydesc
  ELSE
  CONCAT(criticality, ' : ', criticalitydesc)
END
  AS Criticality_Desc,
  CASE
    WHEN notificationType='M1' THEN CASE
    WHEN notifabc_indicator='A' THEN 'SCE'
    WHEN notifabc_indicator='B' THEN 'PCE'
    WHEN notifabc_indicator='C' THEN 'Others'
    WHEN (notifabc_indicator IS NULL) OR (notifabc_indicator='') OR (notifabc_indicator='null') THEN 'Others'
END
    WHEN notificationType='M2' THEN CASE
    WHEN NotifPriorityCode='1' THEN 'SCE'
    WHEN NotifPriorityCode='2' THEN 'PCE'
    WHEN NotifPriorityCode IS NULL THEN 'Others'
  ELSE
  'Others'
END
END
  AS sceNotification,
  CASE
    WHEN orderType='PM01' THEN CASE
  --when notifabc_indicator='A' and WOMAT ≠ 'NSA' then 'SCE' --CHG
  -- <confirmed from User & RA> when notifabc_indicator='A' and WOMAT = 'NSA' then 'SCE' -> 'Others'
    WHEN notifabc_indicator='A'
  AND WOPriorityCode = '1' THEN 'SCE'
    WHEN notifabc_indicator='B' THEN 'PCE'
    WHEN notifabc_indicator IS NULL THEN 'Others'
  ELSE
  'Others'
END
    WHEN orderType='PM02' THEN CASE
  --when WOPriorityCode='1' and WOMAT ≠ 'NSA' then 'SCE' --CHG
    WHEN WOPriorityCode='1' THEN 'SCE'
    WHEN WOPriorityCode='2' THEN 'PCE'
    WHEN WOPriorityCode IS NULL THEN 'Others'
  ELSE
  'Others'
END
    WHEN (orderType='PM03') OR (orderType='PM06') THEN 'Others'
  --         CASE
  --             when notifabc_indicator='A' then 'SCE'
  --             when notifabc_indicator='B' then 'PCE'
  --             when notifabc_indicator is null then 'Others'
  --             else 'Others'
  --           END
END
  AS SCE_WorkOrder,
  CASE
    WHEN WOStatus LIKE '%DLFL%' OR WOStatus LIKE '%NCMP%' OR WOUStatus LIKE '%CNCL%' OR WOUStatus LIKE '%DUPL%' THEN 'Work Order Cancelled'
    WHEN WOStatus LIKE '%CLSD%' THEN 'Work Order Closed'
    WHEN WOStatus LIKE '%CNF%' AND WOUStatus LIKE '%COMP%' AND WOStatus NOT LIKE '%TECO%' AND WOStatus NOT LIKE '%PCNF%' THEN 'Pending TECO'
    WHEN WOStatus LIKE '%TECO%' THEN 'Work Order Completed'
    WHEN WOUStatus LIKE '%REXT%' THEN 'Pending External Services'
    WHEN WOUStatus LIKE '%RINT%' THEN 'Pending Internal Execution'
    WHEN WOUStatus LIKE '%RSCH%' THEN 'Ready for Scheduling'
    WHEN WOStatus LIKE '%REL%' THEN 'Not Ready for Scheduling'
    WHEN WOStatus LIKE '%CRTD%' THEN 'Pending Release'
END
  AS WOPhase2,
  CASE
    WHEN NotifStatus LIKE '%NOCO%' THEN 'Notification Closed'
    WHEN NotifStatus LIKE '%APRQ%' THEN 'Notification Pending Approval'
    WHEN NotifStatus LIKE '%ORAS%' THEN 'Notification Pending Close'
    WHEN NotifStatus LIKE '%APOK%'
  OR NotifStatus LIKE '%NOPR%' THEN 'Notification Pending Work Order Creation'
  ELSE
  'Notification Status Others'
END
  NotifStatusColor,
  CASE
    WHEN WorkOrder IS NULL AND Notification IS NOT NULL AND (NotifStatus LIKE '%DLFL%' OR NotifStatus LIKE '%APRF%') THEN 'Notification Cancelled'
    WHEN WOStatus LIKE '%NCMP%'
  AND WOStatus LIKE '%CNCL%' THEN 'WO Cancelled Before Released'
    WHEN WOUStatus LIKE '%CNCL%' AND ( WOStatus LIKE '%CLSD%' OR WOStatus LIKE '%REL%' OR WOStatus LIKE '%TECO%' OR ( WOStatus LIKE '%DLFL%' AND WOStatus NOT LIKE '%CRTD%' ) ) THEN 'WO Cancelled After Released'
END
  NotifWOCancelStatus,
  CASE
    WHEN NotifRequiredEndDate IS NULL THEN 'No RED'
  ELSE
  CASE
    WHEN DaysTillRED < 0 THEN 'Past RED'
    WHEN DaysTillRED<=14 THEN '0-14'
    WHEN (DaysTillRED>14) AND (DaysTillRED<=30) THEN '15-30'
    WHEN (DaysTillRED>30)
  AND (DaysTillRED<=60) THEN '31-60'
    WHEN DaysTillRED>60 THEN '>60'
END
END
  AS NotifDaysToLDDShort,
  CASE
    WHEN LDDDate IS NULL THEN 'No LDD'
  ELSE
  CASE
    WHEN DaysTillLDD < 0 THEN 'Past LDD'
    WHEN DaysTillLDD<=14 THEN '0-14'
    WHEN (DaysTillLDD>14) AND (DaysTillLDD<=30) THEN '15-30'
    WHEN (DaysTillLDD>30)
  AND (DaysTillLDD<=60) THEN '31-60'
    WHEN DaysTillLDD>60 THEN '>60'
END
END
  AS WODaysToLDD,
  CASE
    WHEN LDDDate IS NULL THEN 'No LDD'
    WHEN DaysTillLDD >= 0 THEN NULL --'LDD in Future'                              --Revise 20201212
  ELSE
  CASE
    WHEN (-1*DaysTillLDD)>0 AND (-1*DaysTillLDD)<=14 THEN '0-14'
    WHEN ((-1*DaysTillLDD)>14)
  AND ((-1*DaysTillLDD)<=30) THEN '15-30'
    WHEN ((-1*DaysTillLDD)>30) AND ((-1*DaysTillLDD)<=60) THEN '31-60'
    WHEN (-1*DaysTillLDD)>60 THEN '>60'
END
END
  WODaysOverLDD,
  CASE
    WHEN LDDDate IS NULL THEN 'No LDD'
    WHEN DaysTillLDD >= 0 THEN 'LDD in Future'
  ELSE
  CAST(DaysTillLDD*-1 AS STRING)
END
  AS WODaysOverLDD_date,
  CASE
    WHEN LDDDate IS NULL THEN 'No LDD'
    WHEN WOTECODate IS NULL THEN 'In Progress'
  ELSE
  CAST(DaysLDDTillWOTECO*-1 AS STRING)
END
  AS WOTECODateOverLDD_date,
  CASE
    WHEN WOTECODate IS NULL THEN CASE
    WHEN DaysTillLDD <=0 THEN 1
    WHEN DaysTillLDD > 0 THEN 2
END
  ELSE
  CASE
    WHEN DaysLDDTillWOTECO > 0 THEN 1
    WHEN DaysLDDTillWOTECO <=0 THEN 0
END
END
  WODueDateComp,
  CASE
    WHEN WOTECODate IS NULL THEN CASE
    WHEN DaysTillLDD <=0 THEN 'Non-Compliant'
    WHEN DaysTillLDD > 0 THEN 'In Progress'
END
  ELSE
  CASE
    WHEN DaysLDDTillWOTECO > 0 THEN 'Non-Compliant'
    WHEN DaysLDDTillWOTECO <=0 THEN 'Compliant'
END
END
  WODueDateComp_Desc,
  CASE
    WHEN MDDDate IS NULL THEN 'No MDD'
    WHEN DaysTillMDD >= 0 THEN 'MDD in Future'
  ELSE
  CAST(DaysTillMDD*-1 AS STRING)
END
  AS WODaysOverMDD_date,
  CASE
    WHEN MDDDate IS NULL THEN 'No MDD'
  ELSE
  CASE
    WHEN DaysTillMDD < 0 THEN 'Past MDD'
    WHEN DaysTillMDD<=14 THEN '0-14'
    WHEN (DaysTillMDD>14) AND (DaysTillMDD<=30) THEN '15-30'
    WHEN (DaysTillMDD>30) AND (DaysTillMDD<=60) THEN '31-60'
    WHEN DaysTillMDD>60 THEN '>60'
    END
  END
  AS WODaysToMDD,
  CASE
    WHEN MDDDate IS NULL THEN 'No MDD'
    WHEN DaysTillMDD >= 0 THEN NULL
    WHEN (-1*DaysTillMDD)>0 AND (-1*DaysTillMDD)<=14 THEN '0-14'
    WHEN ((-1*DaysTillMDD)>14) AND ((-1*DaysTillMDD)<=30) THEN '15-30'
    WHEN ((-1*DaysTillMDD)>30) AND ((-1*DaysTillMDD)<=60) THEN '31-60'
    WHEN (-1*DaysTillMDD)>60 THEN '>60'
END
  AS WODaysOverMDD,
  CASE
    WHEN MDDDate IS NULL THEN 'No MDD'
    WHEN WOTECODate IS NULL THEN 'In Progress'
  ELSE
  CAST(DaysMDDTillWOTECO*-1 AS STRING)
END
  AS WOTECODateOverMDD_date,
  CASE
    WHEN WOTECODate IS NULL THEN CASE
    WHEN DaysTillMDD <=0 THEN 1
    WHEN DaysTillMDD > 0 THEN 2
END
  ELSE
  CASE
    WHEN DaysMDDTillWOTECO > 0 THEN 1
    WHEN DaysMDDTillWOTECO <=0 THEN 0
END
END
  AS WODueDateCompMDD,
  CASE
    WHEN WOTECODate IS NULL THEN CASE
    WHEN DaysTillMDD <=0 THEN 'Non-Compliant'
    WHEN DaysTillMDD > 0 THEN 'In Progress'
END
  ELSE
  CASE
    WHEN DaysMDDTillWOTECO > 0 THEN 'Non-Compliant'
    WHEN DaysMDDTillWOTECO <=0 THEN 'Compliant'
END
END
  AS WODueDateCompMDD_Desc
FROM (
  SELECT
    *,
    CASE
      WHEN WorkOrder IS NULL THEN Notification
    ELSE
    WorkOrder
  END
    WOandNotif,
    CASE
      WHEN WorkOrder IS NULL THEN NotifFunctionalLocation
    ELSE
    WOFunctionalLocation
  END
    NotifWOFunctionalLocation,
    CASE
      WHEN WorkOrder IS NULL THEN NotifFunctionalLocationDesc
    ELSE
    WOFunctionalLocationDesc
  END
    NotifWOFunctionalLocationDesc,
    CASE
      WHEN WorkOrder IS NULL THEN NotifReferenceDate
    ELSE
    WOReferenceDate
  END
    AS WOandNotifRefDate,
    CASE
      WHEN WorkOrder IS NULL THEN NotifMainWorkCenterDesc
    ELSE
    WOMainWorkCenterDesc
  END
    MainWorkCenter,
    CASE
      WHEN WorkOrder IS NULL THEN NotifPriority
    ELSE
    WOPriority
  END
    Priority,
    CASE
      WHEN WorkOrder IS NULL THEN NotifPlatform
    ELSE
    WOPlatform
  END
    Platform,
    DATE_DIFF(DAY,NotifRequiredEndDate,CurrentDate) AS DaysTillRED,
    DATE_DIFF(DAY,LDDDate,CurrentDate) AS DaysTillLDD,
    DATE_DIFF(DAY,WOTECODate,LDDDate) AS DaysLDDTillWOTECO,
    DATE_DIFF(DAY,snapshotDate, wocreateddate) AS WO_Aging_KPI2a,
    -- beware datetime
    DATE_DIFF(DAY,snapshotDate, ustatuspendsowdate) AS WO_Aging_KPI2b,
    DATE_DIFF(DAY,snapshotDate, ustatuspendbid_contractrdate) AS WO_Aging_KPI2c,
    DATE_DIFF(DAY,snapshotDate, woscheduledstartdate) AS WO_Aging_KPI3a,
    DATE_DIFF(DAY,snapshotDate, woscheduledstartdate) AS WO_Aging_KPI3b,
    DATE_DIFF(DAY,snapshotDate, woscheduledstartdate) AS WO_Aging_KPI4a,
    DATE_DIFF(DAY,snapshotDate, woscheduledfinishdate) AS WO_Aging_KPI5a,
    DATE_DIFF(DAY,snapshotDate, wostatusconfirmeddate) AS WO_Aging_KPI5b,
    DATE_DIFF(DAY,snapshotDate, notifcreateddate) AS Notif_Aging_KPI1a,
    DATE_DIFF(DAY,snapshotDate, notifstatusapprovalokdate) AS Notif_Aging_KPI1b,
    DATE_DIFF(DAY,snapshotDate, WOTECODate) AS Notif_Aging_KPI5c,
    DATE_DIFF(DAY,CurrentDate,ustatuspendwordate) AS WO_Aging_KPI2b_1,
    DATE_DIFF(DAY,CurrentDate,ustatusengrreviewreqdate) AS WO_Aging_KPI2b_2,
    DATE_DIFF(DAY,CurrentDate,ustatuspendwopdate) AS WO_Aging_KPI2b_3,
    DATE_DIFF(DAY,CurrentDate,ustatuspendstrdate) AS WO_Aging_KPI2b_4,
    DATE_DIFF(DAY,CurrentDate,ustatuspendterdate) AS WO_Aging_KPI2b_5,
    DATE_DIFF(DAY,CurrentDate,ustatuspendspfdate) AS WO_Aging_KPI2b_6,
    DATE_DIFF(DAY,CurrentDate,ustatuspendcerdate) AS WO_Aging_KPI2b_7,
    DATE_DIFF(DAY,MDDDate,CurrentDate) AS DaysTillMDD,
    DATE_DIFF(DAY,WOTECODate,MDDDate) AS DaysMDDTillWOTECO
  FROM (
    SELECT
      * ,
      DATE_ADD(LAST_DAY(LDDDate),  5 ) AS MDDDate
    FROM (
      SELECT
        *,
        CAST(1 AS INT) AS CurrentFlag,
        --EXTRACT(DATE FROM current_timestamp ) AS CurrentDate  --Revise 20201212
        to_date(current_timestamp) AS CurrentDate
        ,EXTRACT(DAYOFWEEK FROM snapshotdate) AS snapshotweekday
      FROM
        demo_dbt.pm_kpi_wo_notif_and_oper_current_tbl
      UNION ALL
      SELECT
        *,
        CAST(0 AS INT) AS CurrentFlag,
        --EXTRACT(DATE FROM current_timestamp ) AS CurrentDate  --Revise 20201212
        to_date(current_timestamp) AS CurrentDate
        ,EXTRACT(DAYOFWEEK FROM snapshotdate) AS snapshotweekday
      FROM
        demo_dbt.pm_kpi_wo_notif_and_oper_historical
        --            WHERE
        --FORMAT_DATE('%a', cast(snapshotDatetime as Date)) = 'Wed'                         --Revise 20201212
        --EXTRACT(DAYOFWEEK FROM snapshotDatetime AT TIME ZONE 'Asia/Kuala_Lumpur') = 4       --Revise 20201212
        ) mergetbl ) T1 ) pm_kpi
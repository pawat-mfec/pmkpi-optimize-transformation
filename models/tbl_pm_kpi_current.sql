SELECT
  *
FROM
  {{ ref('tbl_pm_kpi_view') }}
WHERE
  CurrentFlag = 1
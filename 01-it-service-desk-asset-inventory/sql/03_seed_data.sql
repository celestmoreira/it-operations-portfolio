-- IT Asset Inventory: Operational Queries
USE it_asset_inventory;

-- SECTION A — IT OPERATIONS REPORTING

-- A1. Full inventory with who has what and where
SELECT  a.asset_tag,
        a.asset_type,
        a.manufacturer,
        a.model,
        a.status,
        l.name AS location,
        CONCAT(e.first_name, ' ', e.last_name) AS assigned_to
FROM assets a
LEFT JOIN locations l ON a.location_id = l.location_id
LEFT JOIN employees e ON a.assigned_to = e.employee_id
ORDER BY a.asset_tag;

-- A2. Asset count by status 
SELECT status, COUNT(*) AS asset_count
FROM assets
GROUP BY status
ORDER BY asset_count DESC;

-- A3. Asset count and total value by location
SELECT  l.name AS location,
        COUNT(a.asset_id) AS asset_count,
        FORMAT(SUM(a.purchase_cost),2) AS total_value
FROM locations l
LEFT JOIN assets a ON a.location_id = l.location_id
GROUP BY l.location_id, l.name
ORDER BY SUM(a.purchase_cost) DESC;

-- A4. WARRANTY REPORT — expired or expiring within the next 90 days
SELECT  a.asset_tag,
        a.manufacturer,
        a.model,
        a.warranty_expiration,
        CASE
            WHEN a.warranty_expiration < CURDATE() THEN 'EXPIRED'
            WHEN a.warranty_expiration <= DATE_ADD(CURDATE(), INTERVAL 90 DAY) THEN 'Expiring soon'
            ELSE 'Active'
        END AS warranty_status,
        v.name AS vendor,
        v.support_phone
FROM  assets a
LEFT JOIN vendors v ON a.vendor_id = v.vendor_id
WHERE a.warranty_expiration <= DATE_ADD(CURDATE(), INTERVAL 90 DAY)
ORDER BY a.warranty_expiration;

-- A5. Available spares — what's in stock and ready to hand out.
SELECT  asset_tag, asset_type, manufacturer, model
FROM    assets
WHERE   status = 'in_stock' AND assigned_to IS NULL
ORDER BY asset_type;

-- SECTION B — ONBOARDING / OFFBOARDING WORKFLOWS

-- B1. Everything currently assigned to one employee.
SELECT  CONCAT(e.first_name,' ',e.last_name) AS employee,
        d.name AS department,
        a.asset_tag, a.asset_type, a.manufacturer, a.model
FROM employees e
JOIN departments d ON e.department_id = d.department_id
LEFT JOIN assets a ON a.assigned_to = e.employee_id
WHERE e.email = 'mlopez@company.example';

-- B2. New hires (last 30 days) and whether they've been given anything.
SELECT  CONCAT(e.first_name,' ',e.last_name) AS new_hire,
        e.hire_date,
        d.name AS department,
        COUNT(a.asset_id) AS assets_assigned
FROM employees e
JOIN departments d ON e.department_id = d.department_id
LEFT JOIN assets a ON a.assigned_to = e.employee_id
WHERE e.hire_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY e.employee_id, e.first_name, e.last_name, e.hire_date, d.name
ORDER BY e.hire_date DESC;

-- B3. Offboarding check — assets STILL assigned to terminated employees.
SELECT  CONCAT(e.first_name,' ',e.last_name) AS former_employee,
        e.status,
        a.asset_tag, a.asset_type, a.model
FROM employees e
JOIN assets a ON a.assigned_to = e.employee_id
WHERE e.status = 'terminated';

-- B4. Assignment history for one asset (the full lifecycle of a device).
SELECT  a.asset_tag,
        CONCAT(e.first_name,' ',e.last_name) AS held_by,
        asg.assigned_date,
        asg.unassigned_date
FROM asset_assignments asg
JOIN assets a ON asg.asset_id = a.asset_id
JOIN employees e ON asg.employee_id = e.employee_id
WHERE a.asset_tag = 'LB-LT-0001'
ORDER BY asg.assigned_date;

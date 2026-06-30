-- IT Asset Inventory — Sample Data
USE it_asset_inventory;

-- Locations
INSERT INTO locations (name, address, site_type) VALUES
('HQ - Long Beach',   '100 Ocean Blvd, Long Beach, CA', 'office'),
('Warehouse - Carson','550 Industrial Way, Carson, CA', 'warehouse'),
('Remote - West', NULL, 'remote');

-- Departments
INSERT INTO departments (name) VALUES
('Engineering'), ('IT'), ('Sales'), ('HR'), ('Operations');

-- Vendors 
INSERT INTO vendors (name, support_email, support_phone) VALUES
('Dell', 'support@dell.example', '1-800-000-0001'),
('Apple', 'support@apple.example', '1-800-000-0002'),
('Lenovo','support@lenovo.example', '1-800-000-0003'),
('HP', 'support@hp.example', '1-800-000-0004');

-- Employees 
INSERT INTO employees (first_name, last_name, email, job_title, department_id, location_id, hire_date, status) VALUES
('Maria','Lopez',  'mlopez@company.example', 'Software Engineer', 1, 1, '2024-03-11','active'),
('James','Carter', 'jcarter@company.example','IT Technician', 2, 1, '2023-08-01','active'),
('Priya','Nair','pnair@company.example',  'Account Executive', 3, 1, '2025-01-15','active'),
('Tom',  'Becker','tbecker@company.example','Warehouse Lead', 5, 2, '2022-05-20','active'),
('Dana', 'Wright','dwright@company.example','HR Generalist', 4, 1, '2024-11-04','active'),
('Alex', 'Kim', 'akim@company.example',   'Sales Manager', 3, 3, '2021-09-09','terminated'),
('Sam',  'Ortiz', 'sortiz@company.example', 'Software Engineer', 1, 3, '2026-06-22','active'); -- brand-new hire

-- Assets
INSERT INTO assets
(asset_tag, asset_type, manufacturer, model, serial_number, vendor_id, location_id, assigned_to, status, purchase_date, purchase_cost, warranty_expiration, notes) VALUES
('LB-LT-0001','laptop', 'Dell', 'Latitude 5440', 'DL5440-A1', 1, 1, 1, 'assigned', '2024-03-01', 1450.00, '2027-03-01', NULL),
('LB-LT-0002','laptop', 'Apple', 'MacBook Pro 14', 'MBP14-B2',  2, 1, 2, 'assigned', '2023-07-15', 2100.00, '2026-07-15', NULL),
('LB-LT-0003','laptop', 'Lenovo', 'ThinkPad T14', 'TP14-C3',    3, 1, 3,'assigned', '2025-01-10', 1300.00, '2028-01-10', NULL),
('CA-DT-0010','desktop','HP', 'ProDesk 400','PD400-D4',   4, 2, 4, 'assigned', '2022-05-10',  900.00, '2025-05-10', 'Warranty expired'),
('LB-MN-0020','monitor','Dell', 'U2723QE', 'U27-E5',     1, 1, 1,'assigned', '2024-03-01',  600.00, '2027-03-01', NULL),
('LB-LT-0004','laptop', 'Dell', 'Latitude 5440', 'DL5440-F6',  1, 1, NULL, 'in_stock', '2026-05-01', 1450.00, '2029-05-01', 'Spare for onboarding'),
('LB-LT-0005','laptop', 'Apple', 'MacBook Air 13','MBA13-G7',   2, 1, NULL, 'in_stock', '2026-05-01', 1200.00, '2029-05-01', 'Spare for onboarding'),
('LB-PH-0030','phone',  'Apple', 'iPhone 14',     'IP14-H8',    2, 1, 5, 'assigned', '2024-11-01',  800.00, '2026-08-01', 'Warranty expiring soon'),
('CA-PR-0040','printer','HP', 'LaserJet M404', 'LJ404-I9',   4, 2, NULL, 'in_repair','2023-02-01',  350.00, '2025-02-01', 'Paper feed fault'),
('LB-LT-0006','laptop', 'Lenovo', 'ThinkPad T14',  'TP14-J0',    3, 1, NULL, 'retired',  '2020-01-01', 1250.00, '2023-01-01', 'End of life, wiped');

-- Assignment history 
INSERT INTO asset_assignments (asset_id, employee_id, assigned_date, unassigned_date) VALUES
(1, 1, '2024-03-11', NULL),
(2, 2, '2023-08-01', NULL),
(3, 3, '2025-01-15', NULL),
(4, 4, '2022-05-20', NULL),
(5, 1, '2024-03-11', NULL),
(8, 5, '2024-11-04', NULL),
(10,6, '2021-09-09', '2026-04-30');   -- Alex Kim's old laptop, returned on offboarding

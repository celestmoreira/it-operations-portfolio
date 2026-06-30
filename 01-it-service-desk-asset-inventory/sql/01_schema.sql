-- IT Asset Inventory: Schema
-- Purpose: Track hardware assets, the employees they're assigned to, their physical locations, and warranty status.

DROP DATABASE IF EXISTS it_asset_inventory;
CREATE DATABASE it_asset_inventory;
USE it_asset_inventory;

-- locations: physical sites where assets and people live
CREATE TABLE locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(80)  NOT NULL,        
    address VARCHAR(160),
    site_type ENUM('office','warehouse','remote','data_center') NOT NULL DEFAULT 'office',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- departments: org units, used for onboarding 
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(80) NOT NULL UNIQUE
);

-- vendors: who we bought hardware from / who honors the warranty
CREATE TABLE vendors (
    vendor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    support_email VARCHAR(120),
    support_phone VARCHAR(40)
);

-- employees: the "users" assets get assigned to
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    job_title VARCHAR(80),
    department_id INT,
    location_id INT,
    hire_date DATE,
    status ENUM('active','on_leave','terminated') NOT NULL DEFAULT 'active',
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (location_id)   REFERENCES locations(location_id)
);

-- assets: the hardware itself
CREATE TABLE assets (
    asset_id INT AUTO_INCREMENT PRIMARY KEY,
    asset_tag  VARCHAR(40) NOT NULL UNIQUE, 
    asset_type ENUM('laptop','desktop','monitor','phone','printer','server','network','peripheral') NOT NULL,
    manufacturer VARCHAR(60),
    model VARCHAR(80),
    serial_number VARCHAR(80) UNIQUE,
    vendor_id INT,
    location_id INT,
    assigned_to INT,                          
    status ENUM('in_stock','assigned','in_repair','retired') NOT NULL DEFAULT 'in_stock',
    purchase_date DATE,
    purchase_cost DECIMAL(10,2),
    warranty_expiration DATE,
    notes VARCHAR(255),
    FOREIGN KEY (vendor_id)   REFERENCES vendors(vendor_id),
    FOREIGN KEY (location_id) REFERENCES locations(location_id),
    FOREIGN KEY (assigned_to) REFERENCES employees(employee_id)
);

-- asset_assignments: history of who had what and when
CREATE TABLE asset_assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    asset_id INT NOT NULL,
    employee_id INT NOT NULL,
    assigned_date DATE NOT NULL,
    unassigned_date DATE,                                
    FOREIGN KEY (asset_id) REFERENCES assets(asset_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Helpful indexes for the reporting queries
CREATE INDEX idx_assets_status   ON assets(status);
CREATE INDEX idx_assets_warranty ON assets(warranty_expiration);
CREATE INDEX idx_assets_assigned ON assets(assigned_to);
CREATE INDEX idx_emp_department  ON employees(department_id);

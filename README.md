# AutoCare Professional - Vehicle Service & Maintenance Management System (Java OOP)

A comprehensive, standalone **Java desktop application** developed within the **Apache NetBeans** environment demonstrating advanced **Object-Oriented Programming (OOP)** principles, **JDBC database connectivity**, and **Role-Based Access Control (RBAC)** across **Administrator**, **Mechanic**, and **Customer** portals.

---

## 🏛️ Core Technologies & Architectural Standards

| Component | Technology | Description |
| :--- | :--- | :--- |
| **Front End (UI)** | **Java Swing** | Graphical desktop user interface utilizing modern `Nimbus` styling, custom tables, card layouts, dialogs, and role-specific portal windows. |
| **Back End (Logic)** | **Java 17 / 21+** | Application logic, service layers, and business validation following OOP and Facade design patterns. |
| **Database Connectivity** | **JDBC (`mysql-connector-j`)** | Relational database connectivity (`autocare_db` on MySQL localhost:3306) with automatic table creation and data sync. |
| **Persistent Storage** | **Dual Storage (JDBC + CSV)** | Complete fallback and persistence in `/data` CSV files (`customers.csv`, `vehicles.csv`, `services.csv`, `mechanics.csv`, `reports.csv`, `users.csv`). |
| **Development IDE** | **Apache NetBeans** | Native NetBeans and Maven project configuration (`pom.xml`, `nbproject/`, `nbactions.xml`). |

---

## 🔑 Role-Based Access Control (RBAC) & Actor Portals

When the application launches, a modern **Login Dialog** pops up with user authentication and **1-click quick-demo credentials**:

### 1. 🛡️ Administrator Portal (`MainFrame`)
* **Access Scope**: Full administrative control across the entire application.
* **Customer Management**: Add, modify, and delete customers (with cascading validation).
* **Customer Status**: Change customer account status (`Active`, `VIP Client`, `Suspended`, `Inactive`).
* **Track Customer Progress**: Dedicated progress tracker (`CustomerServiceHistoryDialog`) displaying all current and past work orders, assigned mechanics, and completion statuses.
* **Vehicle Fleet Management**: Register, modify, and delete polymorphic vehicles (**Cars**, **Motorcycles**, **Heavy Trucks**).
* **Mechanic Management**: Add and delete mechanics, adjust operational status (`Available`, `Busy`, `On Leave`, `Inactive`), and view assigned job allocations.
* **Service Booking & Workflow**: Book maintenance appointments with real-time labor cost quotes, assign mechanics from registered staff, and track workflow (`Scheduled` ➔ `In Progress` ➔ `Completed`).
* **Invoicing & Printing**: Generate itemized invoices via `Payable` and print physical customer receipts using Java Print Services.
* **Mechanic Work Reports Review**: Review diagnostic and work completion reports submitted by technicians.
* **Business Analytics**: Financial revenue aggregation, service package breakdown, and fleet composition reports.

### 2. 🔧 Mechanic / Technician Portal (`MechanicPortalFrame`)
* **Access Scope**: Dedicated workspace filtered strictly to jobs assigned to the logged-in technician.
* **Assigned Work Orders**: Monitor pending, in-progress, and completed jobs.
* **Progress Updates**: Update work order lifecycle status, record labor hours, add replacement parts costs, and enter technical notes.
* **Diagnostic & Work Reports**: Draft and submit formal inspection and repair reports for administrative review.
* **Vehicle Inspection Protocols**: Access multi-point inspection checklists tailored to the vehicle category.
* **Operational Status**: Toggle availability status (`Available`, `Busy`, `On Leave`).
* **Logout**: Secure session termination returning to the login window.

### 3. 👤 Customer / Vehicle Owner Portal (`CustomerPortalFrame`)
* **Access Scope**: Self-service client portal linked to the customer's personal portfolio.
* **My Registered Vehicles**: View technical specifications, odometer readings, and recommended service intervals for all owned vehicles.
* **Live Service Progress Tracking**: Real-time progress tracker with visual workflow indicators:
  - `Step 1/3: Scheduled` (Queued for intake inspection)
  - `Step 2/3: In Progress` (Technician actively servicing vehicle)
  - `Step 3/3: Completed` (Ready for pickup / Invoiced)
* **My Invoices & Receipts**: View itemized billing breakdowns and print official payment receipts.
* **Logout**: Clean logout returning to the login window.

---

## 📋 Default Preloaded Login Credentials

| Role | Username | Password | Full Name / Description |
| :--- | :--- | :--- | :--- |
| **Admin** | `admin` | `admin123` | System Administrator (Full Access) |
| **Mechanic** | `dave` | `dave123` | Dave Miller (Brake & Heavy Suspensions Specialist) |
| **Mechanic** | `sam` | `sam123` | Sam Peterson (Electrical, EV & HVAC Specialist) |
| **Mechanic** | `sarah` | `sarah123` | Sarah Lin (Master Engine Diagnostics & Hybrids) |
| **Mechanic** | `okuma` | `okuma123` | Okuma (Transmission Specialist) |
| **Customer** | `alice` | `alice123` | Alice Johnson (Owner of Toyota Camry Hybrid) |
| **Customer** | `robert` | `robert123` | Robert Martinez (Owner of Honda CR-V & Harley) |
| **Customer** | `elena` | `elena123` | Elena Rostova (Owner of Yamaha MT-07) |
| **Customer** | `marcus_v`| `marcus123`| Marcus Vance (Owner of Ford F-450 & Freightliner) |
| **Customer** | `chairman`| `chairman123`| Chairman Karamuzi (Owner of Toyota Zuku Truck) |
| **Customer** | `daniel` | `daniel123` | Daniel (Owner of Toyota Noah) |

*(Note: The login dialog features one-click buttons to automatically fill credentials for testing).*

---

## 🏛️ Object-Oriented Programming (OOP) Principles Demonstrated

| OOP Principle | Implementation in Codebase |
| :--- | :--- |
| **1. Abstraction** | • **`Vehicle` (Abstract Base Class)**: Defines contract for `calculateServiceMultiplier()`, `getRecommendedServiceIntervalKm()`, and `getSpecializedInspectionItems()`.<br>• **`Person` (Abstract Base Class)**: Base class defining shared attributes and abstract method `getRoleName()`.<br>• **`Payable` (Interface)**: Defines billing calculations: `calculateSubtotal()`, `calculateTax()`, `calculateTotalCost()`, and `generateInvoiceSummary()`. |
| **2. Inheritance** | • **Vehicle Hierarchy**: Subclasses `Car`, `Motorcycle`, and `Truck` inherit shared properties (`make`, `model`, `year`, `mileage`, `licensePlate`) and extend category-specific fields (e.g. `fuelType` & `doors` for `Car`, `engineCapacityCc` & `hasSidecar` for `Motorcycle`, `cargoCapacityTons` & `hasAirBrakes` for `Truck`).<br>• **Person Hierarchy**: `Customer` and `Mechanic` extend abstract class `Person`. |
| **3. Polymorphism** | • **Method Overriding**: Each vehicle subclass overrides `calculateServiceMultiplier()` (Truck = 1.7x, Car = 1.0x / 1.15x Hybrid, Bike = 0.8x) and category checklists.<br>• **Interface Polymorphism**: `ServiceRecord` implements `Payable`, enabling decoupled invoice generation.<br>• **Dynamic Cost Estimator**: `vehicle.calculateEstimatedServiceCost(serviceType)` dynamically calculates labor charges.<br>• **Role Polymorphism**: Authenticated users dynamically open role-specific interfaces (`MainFrame`, `MechanicPortalFrame`, `CustomerPortalFrame`). |
| **4. Encapsulation** | • Private instance variables across all entity models.<br>• Access and mutations strictly controlled via validated mutators (e.g., odometer bounds checking, non-empty IDs, boundary validation). |

---

## 📂 Project Directory Structure

```text
VSMM/
├── pom.xml                                   # Maven configuration with MySQL connector
├── build.xml                                 # Apache NetBeans Ant build script
├── nbactions.xml                             # NetBeans custom actions
├── nbproject/                                # NetBeans IDE project metadata
├── lib/
│   └── mysql-connector-j-9.7.0.jar           # MySQL JDBC Driver library
├── data/                                     # Persistent flat file CSV storage
│   ├── customers.csv
│   ├── vehicles.csv
│   ├── services.csv
│   ├── mechanics.csv
│   ├── reports.csv
│   └── users.csv
├── run.bat                                   # 1-Click execution script
├── Open_In_NetBeans.bat                      # NetBeans launcher script
└── src/
    ├── main/java/com/vehicleservice/
    │   ├── Main.java                         # Application entry point & L&F setup
    │   ├── model/                            # OOP Domain Models
    │   │   ├── Person.java                   # Abstract base class for persons
    │   │   ├── Customer.java                 # Customer entity (extends Person)
    │   │   ├── CustomerStatus.java           # Customer status enum
    │   │   ├── Mechanic.java                 # Mechanic entity (extends Person)
    │   │   ├── MechanicStatus.java           # Mechanic status enum
    │   │   ├── MechanicReport.java           # Mechanic work report model
    │   │   ├── User.java                     # User authentication model
    │   │   ├── UserRole.java                 # Access role enum
    │   │   ├── Vehicle.java                  # Abstract base class for vehicles
    │   │   ├── Car.java                      # Car subclass
    │   │   ├── Motorcycle.java               # Motorcycle subclass
    │   │   ├── Truck.java                    # Truck subclass
    │   │   ├── VehicleFactory.java           # Factory pattern implementation
    │   │   ├── Payable.java                  # Financial contract interface
    │   │   ├── ServiceRecord.java            # Service work order (implements Payable)
    │   │   ├── ServiceStatus.java            # Work order lifecycle enum
    │   │   └── ServiceType.java              # Service catalog enum
    │   ├── storage/                          # Persistence Layer
    │   │   ├── DatabaseManager.java          # JDBC MySQL connection & auto-table manager
    │   │   └── CsvStorage.java               # Dual-sync CSV storage & JDBC fallback
    │   ├── model/                            # Domain Model Tier (Pure OOP)
    │   │   ├── Person.java                   # Abstract base class (Abstraction)
    │   │   ├── Customer.java                 # Extends Person (Inheritance)
    │   │   ├── CustomerStatus.java           # Account status enum
    │   │   ├── Mechanic.java                 # Extends Person (Inheritance)
    │   │   ├── MechanicStatus.java           # Availability status enum
    │   │   ├── MechanicReport.java           # Diagnostic & work report entity
    │   │   ├── Vehicle.java                  # Abstract base vehicle (Polymorphism)
    │   │   ├── Car.java, Motorcycle.java, Truck.java # Concrete subclasses
    │   │   ├── ServiceRecord.java            # Maintenance order entity (implements Payable)
    │   │   ├── SparePart.java                # Workshop inventory & stock entity
    │   │   ├── Review.java                   # Customer rating (1-5 stars) & review entity
    │   │   └── Payable.java                  # Financial interface contract
    │   ├── payment/                          # Strategy Pattern: Multi-Method Payment
    │   │   ├── PaymentStrategy.java          # Strategy interface
    │   │   ├── CashPayment.java              # Cash calculation & change due
    │   │   ├── CardPayment.java              # Card validation & PCI PAN masking
    │   │   ├── MobileMoneyPayment.java       # M-Pesa / PayPal / Apple Pay
    │   │   ├── BankTransferPayment.java      # Electronic wire & EFT
    │   │   └── PaymentTransaction.java       # Financial settlement transaction record
    │   ├── pricing/                          # Decorator Pattern: Dynamic Pricing
    │   │   ├── ServicePricing.java           # Component interface
    │   │   ├── BaseServicePricing.java       # Concrete base component
    │   │   ├── ServicePricingDecorator.java  # Abstract decorator
    │   │   ├── VipDiscountDecorator.java     # 15% VIP loyalty discount
    │   │   ├── PromotionalDiscountDecorator.java # Promotional coupon discount
    │   │   ├── ExtendedWarrantyDecorator.java # 6-month warranty add-on
    │   │   ├── PremiumSyntheticFluidsDecorator.java # Synthetic fluids upgrade
    │   │   └── ExpressPriorityServiceDecorator.java # Express rush queue
    │   ├── assignment/                       # Strategy Pattern: Smart Technician Allocation
    │   │   ├── MechanicAssignmentStrategy.java # Strategy interface
    │   │   ├── AssignmentResult.java         # Selection outcome & rationale
    │   │   ├── SkillMatchStrategy.java       # Specialization & vehicle category matching
    │   │   ├── WorkloadBalancingStrategy.java # Least-busy active queue matching
    │   │   ├── RatingBasedStrategy.java      # Customer rating priority matching
    │   │   └── RoundRobinStrategy.java       # Fair cyclical rotation
    │   ├── service/                          # Business Logic Layer
    │   │   ├── AuthService.java              # Authentication & user authorization
    │   │   ├── CustomerService.java          # Customer directory operations
    │   │   ├── MechanicService.java          # Mechanic operations & status changes
    │   │   ├── MechanicReportService.java    # Work report tracking operations
    │   │   ├── VehicleService.java           # Vehicle operations & mileage updates
    │   │   ├── MaintenanceService.java       # Work order scheduling & financial metrics
    │   │   ├── PaymentService.java           # Payment settlement & receipt generation
    │   │   ├── InventoryService.java         # Spare parts catalog & stock control
    │   │   ├── ReviewService.java            # Customer reviews & stream rating analytics
    │   │   └── ServiceCenterManager.java     # Facade coordinating all services
    │   └── ui/                               # Java Swing Desktop Graphical Interface
    │       ├── LoginDialog.java              # Startup authentication dialog
    │       ├── MainFrame.java                # Administrator master console (8 tabs)
    │       ├── MechanicPortalFrame.java      # Dedicated mechanic workspace window
    │       ├── CustomerPortalFrame.java      # Dedicated customer self-service window
    │       ├── panels/
    │       │   ├── DashboardPanel.java       # Admin dashboard & live KPIs
    │       │   ├── VehiclePanel.java         # Fleet management table & actions
    │       │   ├── CustomerPanel.java        # Customer management & status tracking
    │       │   ├── MechanicPanel.java        # Mechanic directory, ratings & job tracking
    │       │   ├── ServicePanel.java         # Service orders & progress management
    │       │   ├── InventoryPanel.java       # Spare parts stock management & KPIs
    │       │   ├── MechanicReportsPanel.java # Review reports submitted by mechanics
    │       │   └── ReportsPanel.java         # Financial analytics & business intelligence
    │       ├── dialogs/
    │       │   ├── CustomerDialog.java       # Add / edit customer
    │       │   ├── CustomerServiceHistoryDialog.java # Track progress of every customer
    │       │   ├── MechanicDialog.java       # Add / edit mechanic & password
    │       │   ├── MechanicReportSubmissionDialog.java # Work report & parts used logging
    │       │   ├── MechanicReviewsDialog.java # Mechanic performance & customer feedback
    │       │   ├── ReviewDialog.java         # 5-star interactive customer review submission
    │       │   ├── SparePartDialog.java      # Add / edit inventory spare part
    │       │   ├── PaymentDialog.java        # Multi-method checkout & payment settlement
    │       │   ├── PaymentReceiptDialog.java # Official printable settlement receipt
    │       │   ├── VehicleDialog.java        # Add / edit vehicle (CardLayout)
    │       │   ├── ServiceBookingDialog.java # Decorator pricing & smart assignment
    │       │   ├── ServiceUpdateDialog.java  # Order status, labor & parts charges
    │       │   ├── InvoiceDialog.java        # Itemized printable invoice & payment action
    │       │   └── InspectionDialog.java     # Category-specific inspection checklist
    │       └── util/
    │           ├── UIUtils.java              # Styling, colors, fonts, tables & stat cards
    │           └── VSMMLogo.java             # Vector graphics automotive shield logo generator
    └── test/java/com/vehicleservice/
        └── VehicleServiceTest.java           # 18 comprehensive unit and integration tests (OOP & Patterns)
```

---

## 🔐 "Welocom to VSMM UG" Portal Login & Actor Credentials

The startup login window (`LoginDialog`) features a modern dual-tone layout with a resolution-independent vector emblem and zero autofill buttons. Actors type their credentials directly:

| Actor Role | Username / ID | Password | Access Capabilities |
| :--- | :--- | :--- | :--- |
| **🛡️ Administrator** | `admin` | `admin123` | Master control console: Customer/vehicle management, mechanic assignments, invoicing, inventory, ratings & analytics |
| **🔧 Mechanic** | `dave` or `MECH-101`<br>`sam` or `MECH-102`<br>`sarah` or `MECH-103`<br>`marcus` or `MECH-104`<br>`okuma` or `MECH-105`<br>`mukisa.jesa` or `MECH-106`<br>`mongo.mushi` or `MECH-107` | `dave123`<br>`sam123`<br>`sarah123`<br>`marcus123`<br>`okuma123`<br>`mukisa123`<br>`mongopro`<br>*(or `tech123`)* | Dedicated technician workspace: View assigned jobs, update progress, submit work reports, log spare parts |
| **🚗 Customer** | `alice` or `CUST-101`<br>`robert` or `CUST-102`<br>`chairman` or `0761653765`<br>`daniel` or `0773317856`<br>`okwi.brain` or `0783726354`<br>`mukiga.joy` or `0763625384`<br>`shafik.kusaga` or `0779543624`<br>`kintu.ashiraf` or `0744313060` | `alice123`<br>`robert123`<br>`chairman123`<br>`daniel123`<br>*(or `cust123`)* | Customer self-service portal: Owned vehicle records, live repair tracking, UGX invoices, 5-star mechanic reviews |

> 💡 **Tip for Defense / Presentation**: Click the **"📋 View All Portal Accounts Directory"** button on the login dialog at any time to open a searchable directory showing every registered Admin, Mechanic, and Customer with their credentials, linked vehicle, and direct 1-click test login!

---

## 🇺🇬 Ugandan Currency (UGX) & Real-World Garage Estimator

All monetary amounts across the system operate on the **realistic Ugandan Shillings (`UGX`) market scale**:
- **Vehicle Brand-Tier Spare Part Estimator (`SparePartEstimator.java`)**:
  - Dynamically detects market tiers: **Japanese Standard** (Toyota, Nissan, Honda - 1.0x factor), **European Luxury** (Mercedes-Benz, BMW, Audi - 1.9x factor), **Heavy Commercial Fleet** (Isuzu, Scania, Fuso - 2.4x factor), and **Lightweight Motorcycle / Boda** (Bajaj Boxer, TVS, Yamaha - 0.4x factor).
  - Automatically calculates itemized spare parts packages in realistic Ugandan Shillings (e.g. OEM Oil Filter @ UGX 35,000, Full Synthetic Oil @ UGX 160,000, Ceramic Brake Pads @ UGX 140,000, 12V Battery @ UGX 420,000).
- **Admin Editable Money Amounts**:
  - In both `ServiceBookingDialog` and `ServiceUpdateDialog`, the administrator can freely **type any amount of money** in UGX for labor and spare parts without restrictive spinner limits.
  - Live recalculation updates Subtotal, 8% VAT, and Grand Total immediately as amounts are typed.
  - In `MechanicDialog`, technician hourly rates are directly editable in UGX (e.g. UGX 45,000/hr).
- **Modernized Dashboards ("You are welcom")**:
  - **Administrator Dashboard (`DashboardPanel`)**: Features modern hero card `"You are welcom, [Admin Name]!"`, live UGX revenue counter, active repair queue, and inventory alerts.
  - **Mechanic Dashboard (`MechanicPortalFrame`)**: Features modern hero card `"You are welcom, [Mechanic Name]!"`, assigned vehicle brand badges, work reports launcher, and hourly wage chips.
  - **Customer Dashboard (`CustomerPortalFrame`)**: Features modern hero card `"You are welcom, [Customer Name]!"`, VIP client discount tags, 3-step live service progression tracker, and direct UGX invoice settlement.
- **Ugandan Payment Providers**:
  - Supports **MTN Mobile Money**, **Airtel Money**, and Ugandan commercial banks (**Stanbic Bank Uganda**, **Centenary Bank**).

---

## 🚀 How to Run the Application

### Option 1: Inside Apache NetBeans (Recommended)
1. Open **Apache NetBeans**.
2. Click **File** ➔ **Open Project...** (`Ctrl + Shift + O`).
3. Select the `VSMM` folder (`c:\Users\HP\OneDrive\Desktop\VSMM`) and click **Open Project**.
4. In the NetBeans **Projects** pane, right-click the project name and select **Run** (or press `F6`).

### Option 2: Using the One-Click Batch Script
Double-click `run.bat` inside `c:\Users\HP\OneDrive\Desktop\VSMM`.

### Option 3: Terminal Command
```powershell
cd "c:\Users\HP\OneDrive\Desktop\VSMM"
& "C:\Program Files\Apache NetBeans\java\maven\bin\mvn.cmd" compile exec:java
```
Or run the unit test suite:
```powershell
& "C:\Program Files\Apache NetBeans\java\maven\bin\mvn.cmd" test
```

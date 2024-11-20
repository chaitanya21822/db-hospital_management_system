use hims;

-- AccessRights Constraints
ALTER TABLE AccessRights
ADD CONSTRAINT FK_AccessRights_User FOREIGN KEY (UserID) REFERENCES User(UserID),
ADD CONSTRAINT FK_AccessRights_Functionality FOREIGN KEY (FunctionalityID) REFERENCES ApplicationFunctionality(FunctionalityID);

-- Admission Constraints
ALTER TABLE Admission
ADD CONSTRAINT FK_Admission_PatientCategory FOREIGN KEY (PatientCategoryID) REFERENCES PatientCategory(PatientCategoryID),
ADD CONSTRAINT FK_Admission_Patient FOREIGN KEY (PatientId) REFERENCES Patient(PatientID),
ADD CONSTRAINT FK_Admission_Unit FOREIGN KEY (UnitId) REFERENCES Unit(UnitID),
ADD CONSTRAINT FK_Admission_Doctor FOREIGN KEY (DoctorId) REFERENCES Doctor(DoctorID),
ADD CONSTRAINT FK_Admission_Bed FOREIGN KEY (BedId) REFERENCES Bed(BedId),
ADD CONSTRAINT FK_Admission_Company FOREIGN KEY (CompanyId) REFERENCES InsuranceCompany(CompanyId),
ADD CONSTRAINT FK_Admission_Relation FOREIGN KEY (RelationId) REFERENCES Relation(RelationID);

-- Advance Constraints
ALTER TABLE Advance
ADD CONSTRAINT FK_Advance_Patient FOREIGN KEY (PatientId) REFERENCES Patient(PatientID);

-- Bed Constraints
ALTER TABLE Bed
ADD CONSTRAINT FK_Bed_Room FOREIGN KEY (RoomId) REFERENCES Room(RoomId);

-- Bill Constraints
ALTER TABLE Bill
ADD CONSTRAINT FK_Bill_Visit FOREIGN KEY (VisitId) REFERENCES Visit(VisitId),
ADD CONSTRAINT FK_Bill_Admission FOREIGN KEY (AdmissionId) REFERENCES Admission(AdmissionId);

-- Charge Constraints
ALTER TABLE Charge
ADD CONSTRAINT FK_Charge_Visit FOREIGN KEY (VisitId) REFERENCES Visit(VisitId),
ADD CONSTRAINT FK_Charge_Admission FOREIGN KEY (AdmissionId) REFERENCES Admission(AdmissionId),
ADD CONSTRAINT FK_Charge_Service FOREIGN KEY (ServiceId) REFERENCES Service(ServiceId);

-- City Constraints
ALTER TABLE City
ADD CONSTRAINT FK_City_State FOREIGN KEY (StateID) REFERENCES State(StateID);

-- Country Constraints
ALTER TABLE Country
ADD CONSTRAINT FK_Country_Nationality FOREIGN KEY (NationalityID) REFERENCES Nationality(NationalityID);

-- Discharge Constraints
ALTER TABLE Discharge
ADD CONSTRAINT FK_Discharge_Admission FOREIGN KEY (AdmissionId) REFERENCES Admission(AdmissionId),
ADD CONSTRAINT FK_Discharge_Doctor FOREIGN KEY (DoctorId) REFERENCES Doctor(DoctorID);

-- Doctor Constraints
ALTER TABLE Doctor
ADD CONSTRAINT FK_Doctor_Gender FOREIGN KEY (GenderID) REFERENCES Gender(GenderID),
ADD CONSTRAINT FK_Doctor_City FOREIGN KEY (CityID) REFERENCES City(CityID),
ADD CONSTRAINT FK_Doctor_Department FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);

-- Patient Constraints
ALTER TABLE Patient
ADD CONSTRAINT FK_Patient_Gender FOREIGN KEY (GenderID) REFERENCES Gender(GenderID),
ADD CONSTRAINT FK_Patient_City FOREIGN KEY (CityID) REFERENCES City(CityID);

-- Prescription Constraints
ALTER TABLE Prescription
ADD CONSTRAINT FK_Prescription_Visit FOREIGN KEY (VisitId) REFERENCES Visit(VisitId);

-- ClinicalNote Constraints
ALTER TABLE ClinicalNote
ADD CONSTRAINT FK_ClinicalNote_Admission FOREIGN KEY (AdmissionId) REFERENCES Admission(AdmissionId);

-- Room Constraints
ALTER TABLE Room
ADD CONSTRAINT FK_Room_Ward FOREIGN KEY (WardID) REFERENCES Ward(WardID);

-- Service Constraints
ALTER TABLE Service
ADD CONSTRAINT FK_Service_Category FOREIGN KEY (ServiceCategoryId) REFERENCES ServiceCategory(ServiceCategoryId),
ADD CONSTRAINT FK_Service_Type FOREIGN KEY (ServiceTypeId) REFERENCES ServiceType(ServiceTypeID),
ADD CONSTRAINT FK_Service_Company FOREIGN KEY (CompanyId) REFERENCES InsuranceCompany(CompanyId);

-- Staff Constraints
ALTER TABLE Staff
ADD CONSTRAINT FK_Staff_Gender FOREIGN KEY (GenderID) REFERENCES Gender(GenderID),
ADD CONSTRAINT FK_Staff_City FOREIGN KEY (CityID) REFERENCES City(CityID),
ADD CONSTRAINT FK_Staff_Department FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);

-- State Constraints
ALTER TABLE State
ADD CONSTRAINT FK_State_Country FOREIGN KEY (CountryID) REFERENCES Country(CountryID);

-- Unit Constraints
ALTER TABLE Ward
ADD CONSTRAINT FK_Ward_Unit FOREIGN KEY (UnitId) REFERENCES Unit(UnitID);

-- User Constraints
ALTER TABLE User
ADD CONSTRAINT FK_User_Staff FOREIGN KEY (StaffID) REFERENCES Staff(StaffID);

-- Visit Constraints
ALTER TABLE Visit
ADD CONSTRAINT FK_Visit_Doctor FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
ADD CONSTRAINT FK_Visit_Patient FOREIGN KEY (PatientId) REFERENCES Patient(PatientID),
ADD CONSTRAINT FK_Visit_Category FOREIGN KEY (PatientCategoryID) REFERENCES PatientCategory(PatientCategoryID),
ADD CONSTRAINT FK_Visit_Unit FOREIGN KEY (UnitId) REFERENCES Unit(UnitID);

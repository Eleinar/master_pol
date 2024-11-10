from sqlalchemy import (
Column,
Integer,
String,
Float,
Date,
TIMESTAMP
)

from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine 
from sqlalchemy.orm import sessionmaker
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship

Base = declarative_base()

class ProductTypes(Base):
    __tablename__ = "productTypes"
    
    id = Column(Integer, primary_key = True)
    type_name = Column(String)
    coefficient = Column(Float)
    
class Products(Base):
    __tablename__ = "products"
    
    id = Column(Integer, primary_key = True)
    product_type_id = Column(Integer, ForeignKey(ProductTypes.id))
    product_name = Column(String)
    scu = Column(String)
    min_partner__price = Column(Float)

class SalesLocations(Base):
    __tablename__ = "salesLocations"
    
    id = Column(Integer, primary_key = True)
    location_name = Column(String)
    
class CompanyType(Base):
    __tablename__ = "companytype"
    
    id = Column(Integer, primary_key = True)
    company_type = Column(String)
    
class Partners(Base):
    __tablename__ = "partners"
    
    id = Column(Integer, primary_key = True)
    type_id = Column(Integer, ForeignKey(CompanyType.id))
    company_name = Column(String)
    legal_address = Column(String)
    inn = Column(String)
    director_name = Column(String)
    phone = Column(String)
    email = Column(String)
    rating = Column(Integer)
    
    type_rel = relationship("CompanyType")
    
class Partner_Products(Base):
    __tablename__ = "partner_products"
    
    id = Column(Integer, primary_key = True)
    partner_id = Column(Integer,ForeignKey(Partners.id))
    product_id = Column(Integer,ForeignKey(Products.id))
    quantity = Column(Integer)
    delivery_date = Column(Date)
    
class HealthStatuses(Base):
    __tablename__ = "healthstatuses"
    
    id = Column(Integer, primary_key = True)
    status = Column(String)
    
class FamilyStatuses(Base):
    __tablename__ = "familyStatuses"
    
    id = Column(Integer, primary_key = True)
    status = Column(String)
    
class Roles(Base):
    __tablename__ = "roles"
    
    id = Column(Integer, primary_key = True)
    role_name = Column(String)
    
class Employees(Base):
    __tablename__ = "employees"
    
    id = Column(Integer, primary_key = True)
    emloyee_name = Column(String)
    passport = Column(String)
    bank_account = Column(String)
    family_status_id = Column(Integer, ForeignKey(FamilyStatuses.id))
    health_status_id = Column(Integer, ForeignKey(HealthStatuses.id))
    role_id = Column(Integer, ForeignKey(Roles.id))
    
class AccessRecords(Base):
    __tablename__ = "accessrecords"
    
    id = Column(Integer, primary_key = True)
    entry_time = Column(TIMESTAMP)
    exit_time = Column(TIMESTAMP)
    employee_id = Column(Integer, ForeignKey(Employees.id))
    
class MaterialTypes(Base):
    __tablename__ = "maerialTypes"
    
    id = Column(Integer, primary_key = True)
    type_name = Column(String)
    defect_percent = Column(Float)
    
class UnitTypes(Base):
    __tablename__ = "unitTypes"
    
    id = Column(Integer, primary_key = True)
    unit_type = Column(String)
    
class Materials(Base):
    __tablename__ = "materials"
    
    id = Column(Integer, primary_key = True)
    material_type_id = Column(Integer, ForeignKey(MaterialTypes.id))
    material_name = Column(String)
    package_quantity = Column(Integer)
    unit_id = Column(Integer, ForeignKey(UnitTypes.id))
    description = Column(String)
    material_cost = Column(Float)
    stock_quantity = Column(Integer)
    min_quantity = Column(Integer)
    
class Warehouses(Base):
    __tablename__ = "warehouses"
    
    id = Column(Integer, primary_key = True)
    warehouse_name = Column(String)
    
class OperationType(Base):
    __tablename__ = "operationType"
    
    id = Column(Integer, primary_key = True)
    operation_type = Column(String)
    
class MaterialHistory(Base):
    __tablename__ = "materialHistory"
    
    id = Column(Integer, primary_key = True)
    material_id = Column(Integer, ForeignKey(Materials.id))
    operation_date = Column(Date)
    operation_tye_id = Column(Integer, ForeignKey(OperationType.id))
    quantity = Column(Integer)
    warehouse_id = Column(Integer, ForeignKey(Warehouses.id))

def create_connection():
    engine = create_engine("postgresql://admin:root@localhost:5432/floor", echo = True)
    Base.metadata.create_all(engine)
    Session = sessionmaker(bind=engine)
    session = Session(bind=engine)
    return session
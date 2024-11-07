from sqlalchemy import (
Column,
Integer,
String,
Float,
Date,
TIMESTAMP.
Ima
)

from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine 
from sqlalchemy.orm import sessionmaker
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship

Base = declarative_base()

class ProductTypes(Base):
    __tablename__ = "ProductTypes"
    
    id = Column(Integer, primary_key = True)
    type_name = Column(String)
    coefficient = Column(Float)
    
class Products(Base):
    __tablename_ = "Products"
    
    id = Column(Integer, primary_key = True)
    product_type_id = Column(Integer, ForeignKey(ProductTypes.id))
    product_name = Column(String)
    scu = Column(String)
    min_partner__price = Column(Float)

class SalesLocations(Base):
    __tablename__ = "SalesLocations"
    
    id = Column(Integer, primary_key = True)
    location_name = Column(String)
    
class CompanyType(Base):
    __tablename__ = "CompanyType"
    
    id = Column(Integer, primary_key = True)
    company_type = Column(String)
    
class Partners(Base):
    __tablename__ = "Partners"
    
    id = Column(Integer, primary_key = True)
    type_id = Column(Integer, ForeignKey(CompanyType.id))
    company_name = Column(String)
    legal_adress = Column(String)
    inn = Column(String)
    director_name = Column(String)
    phone = Column(String)
    email = Column(String)
    rating = Column(Integer)
    
class Partner_Products(Base):
    id = Column(Integer, primary_key = True)
    partner_id = Column(Integer,ForeignKey(Partners.id))
    product_id = Column(Integer,ForeignKey(Products.id))
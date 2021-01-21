*** Settings ***
Library     Selenium2Library   implicit_wait=60  timeout=60
Library     Screenshot
Library     DateTime
Library     String

Resource    TestCase/TestCase_Login.robot
Resource    TestCase/TestCase_create_qt.robot
Resource    TestCase/TestCase_duplicate_qt.robot

*** Variables ***


*** Keywords ***


*** Test Cases ***
Login FlowAccount.com
    เปิดเว็บ flowaccount.com
    เข้าหน้า Auth Login FlowAccount
    เข้าใช้งาน FlowAccount
    เข้าใช้งาน FlowAccount สำเร็จ

# Create Quotations
#     เข้าสู่หน้าใบเสนอราคา
#     สร้างใบเสนอราคา
#     เลือกรายชื่อผู้ติดต่อ
#     เพิ่มรายการสินค้า
#     เลือกรายการสินค้า
#     ตรวจสอบยอดรวมเอกสาร
#     บันทึกเอกสาร

Duplicate Quotations
    เข้าสู่หน้าใบเสนอราคา
    สร้างเอกสารซ้ำ 
    


*** Settings ***
Library    Selenium2Library   implicit_wait=60  timeout=60
Library    AutoRecorder      mode=suite
Library    ScreenCapLibrary

*** Variables ***
${browser}    chrome
${new_url}    https://auth-c-preprod.flowaccount.com/
${email_login}   pornsawan_s@flowaccount.com
${password_login}   Flow@1234
${company_name}   น้ำมะนาว มะพร้าว ส้มโอ ฟักแฟง แตงโม ไชโย โห่หิวววววข้าว
${app}  FlowAccount
${welcome}  ภาพรวมบริษัท
${filtertype_thismonth}  เดือนปัจจุบัน
${filtertype_previousMonth}  เดือนก่อน
${filtertype_datetodate}  เลือกช่วงวันที่
${filtertype_previousyear}  ปีก่อน
${filtertype_year}  ปีปัจจุบัน

*** Keywords ***
เปิดเว็บ new ui
    Open Browser     ${new_url}     ${browser}  alias=tab1
    Maximize Browser Window
    Input Text    xpath=//*[@id="Email"]    ${email_login}
    Input Text    xpath=//*[@id="Password"]    ${password_login}
    Click Element   class:login-lbl
เลือก Company
    Click Element   //div[contains(text(),'${company_name}')]
เลือกเมนู Report
    Wait Until Page Contains  ${welcome}  15
    Wait Until Element Is Visible   //i[@class="fl fl-report"]
    Click Element   //i[@class="fl fl-report"]
เลือกเมนูยอดขายตามสินค้า
    Click Element   //p[contains(text(),'ยอดขายตามสินค้า')]
เลือกเมนูยอดขายตามพนักงาน
    Click Element   //p[contains(text(),'ยอดขายตามพนักงาน')]
เลือกเมนูยอดขายตามลูกค้า
    Click Element   //p[contains(text(),'ยอดขายตามลูกค้า')]
เลือกเมนูใบวางบิล
    Click Element   //a[@title="ใบวางบิล"]
เลือกเมนูการเก็บเงิน
    Click Element   //a[@title="การเก็บเงิน"]
เลือกเมนูซื้อ
    Click Element   //a[@title="ซื้อ"]
เลือกเมนูซื้อ>ใบสั่งซื้อ
    Click Element   //a[@title="ใบสั่งซื้อ"]
เลือกเมนูซื้อ>ใบรับสินค้า
    Click Element   //a[@title="ใบรับสินค้า"]
เลือกเมนูซื้อ>ใบรับสินค้าตามสินค้า
    Click Element   //a[@title="ใบรับสินค้าตามสินค้า"]
เลือกเมนูค่าใช้จ่าย
    Click Element   //a[@title="ค่าใช้จ่าย"]
เลือกเมนูค่าใช้จ่าย>สรุปค่าใช้จ่าย
    Click Element   //a[@title="สรุปค่าใช้จ่าย"]
เลือกเมนูค่าใช้จ่าย>การชำระเงิน
    Click Element   //a[@title="การชำระเงิน"]
เลือกเมนูสินค้าคงเหลือ
    Click Element   //a[@title="สินค้าคงเหลือ"]
เลือกเมนูสินค้าคงเหลือ>สรุปสินค้าคงเหลือ
    Click Element   //a[@title="สรุปสินค้าคงเหลือ"]
เลือกเมนูภาษี
    Click Element   //a[@title="ภาษี"]
เลือกเมนูภาษี>ภาษีขายตามเอกสาร
    Click Element   //a[@title="ภาษีขายตามเอกสาร"]
เลือกเมนูภาษี>ภาษีซื้อตามเอกสาร
    Click Element   //a[@title="ภาษีซื้อตามเอกสาร"]
เลือกเมนูภาษี>ภาษีหักณที่จ่าย
    Click Element   //a[@title="ภาษีหัก ณ ที่จ่าย"]
เลือกเมนูบัญชี
    Click Element   //a[@title="บัญชี"]
เลือกเมนูบัญชี>ลูกหนี้ตามเอกสาร
    Click Element   //a[@title="ลูกหนี้ตามเอกสาร"]
เลือกเมนูบัญชี>เจ้าหนี้ตามเอกสาร
    Click Element   //a[@title="เจ้าหนี้ตามเอกสาร"]
เลือกเดือนปัจจุบัน
    Click Element   //button[@class="btn btn-select dropdown-toggle"]
    Click Element   //li[contains(text(),'${filtertype_thismonth}')]
เลือกPreviousMonth
    Click Element   //button[@class="btn btn-select dropdown-toggle"]
    Click Element   //li[contains(text(),'${filtertype_previousMonth}')]
    Click Element   //span[contains(text(),'ม.ค.')]
เลือกช่วงวันที่มากกว่า90
    Click Element   //button[@class="btn btn-select dropdown-toggle"]
    Click Element   //li[contains(text(),'${filtertype_datetodate}')]
    Click Element   //th[contains(text(),'มกราคม 2021')]
    Click Element   //th[@class="datepicker-switch" and text()='2021']
    Click Element   //span[contains(text(),'2020')]
    Click Element   //span[contains(text(),'ต.ค.')]
    Click Element   //td[contains(text(),'10')]
    Click Element   //input[@placeholder="วันที่สิ้นสุด"]
    Click Element   //td[contains(text(),'14')]
เลือกช่วงวันที่น้อยกว่า90
    Click Element   //button[@class="btn btn-select dropdown-toggle"]
    Click Element   //li[contains(text(),'${filtertype_datetodate}')]
    #Click Element   //th[contains(text(),'มกราคม 2021')]
    #Click Element   //th[@class="datepicker-switch" and text()='2021']
    #Click Element   //span[contains(text(),'2020')]
    #Click Element   //span[contains(text(),'ต.ค.')]
    Click Element   //td[contains(text(),'1')]
    Click Element   //input[@placeholder="วันที่สิ้นสุด"]
    Click Element   //td[contains(text(),'14')]
เลือกวันที่
    Click Element   //t[contains(text(),'10')]
เลือกปีปัจจุบัน
    Click Element   //button[@class="btn btn-select dropdown-toggle"]
    Click Element   //li[contains(text(),'${filtertype_year}')]
    #Click Element   //span[contains(text(),'2021')]
เลือกปีก่อน
    Click Element   //button[@class="btn btn-select dropdown-toggle"]
    Click Element   //li[contains(text(),'${filtertype_previousyear}')]
    Click Element   //span[contains(text(),'2020')]
กดแสดงผลรายงาน
    Click Element   //button[@class="btn btn-sm btn-blue"]
กดดาวน์โหลดเอกสารขาย
    Wait Until Element Is Visible    //button[@class="btn btn-lg btn-primary print-btn btn-sales-style"]
    Click Element   //button[@class="btn btn-lg btn-primary print-btn btn-sales-style"]
กดดาวน์โหลดเอกสาร
    Wait Until Element Is Visible    //button[@class="btn btn-lg btn-primary print-btn"]
    Click Element   //button[@class="btn btn-lg btn-primary print-btn"]
กดดาวน์โหลดเอกสารรายงานสรุปยอดขาย
    Wait Until Element Is Visible  //li[contains(text(),'รายงานสรุปยอดขาย')]
    Click Element   //li[contains(text(),'รายงานสรุปยอดขาย')]
กดดาวน์โหลดเอกสารรายงานสรุปยอดขาย(แบบละเอียด)
    Wait Until Element Is Visible   //li[contains(text(),'รายงานสรุปยอดขาย (แบบละเอียด)')]
    Click Element   //li[contains(text(),'รายงานสรุปยอดขาย (แบบละเอียด)')]
กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามสินค้า
    Wait Until Element Is Visible   //li[contains(text(),'รายงานยอดขายแยกตามสินค้า')]
    Click Element   //li[contains(text(),'รายงานยอดขายแยกตามสินค้า')]
กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามสินค้า(แบบละเอียด)
    Wait Until Element Is Visible   //li[contains(text(),'รายงานยอดขายแยกตามสินค้า (แบบละเอียด)')]
    Click Element   //li[contains(text(),'รายงานยอดขายแยกตามสินค้า (แบบละเอียด)')]
กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามพนักงาน
    Wait Until Element Is Visible   //li[contains(text(),'รายงานยอดขายแยกตามพนักงาน')]
    Click Element   //li[contains(text(),'รายงานยอดขายแยกตามพนักงาน')]
กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามพนักงาน(แบบละเอียด)
    Wait Until Element Is Visible   //li[contains(text(),'รายงานยอดขายแยกตามพนักงาน (แบบละเอียด)')]
    Click Element   //li[contains(text(),'รายงานยอดขายแยกตามพนักงาน (แบบละเอียด)')]
กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามลูกค้า
    Wait Until Element Is Visible   //li[contains(text(),'รายงานยอดขายแยกตามลูกค้า')]
    Click Element   //li[contains(text(),'รายงานยอดขายแยกตามลูกค้า')]
กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามลูกค้า(แบบละเอียด)
    Wait Until Element Is Visible   //li[contains(text(),'รายงานยอดขายแยกตามลูกค้า (แบบละเอียด)')]
    Click Element   //li[contains(text(),'รายงานยอดขายแยกตามลูกค้า (แบบละเอียด)')]
กดดาวน์โหลดเอกสารรายงานใบรับสินค้าแยกตามสินค้า
    Wait Until Element Is Visible   //li[contains(text(),'รายงานใบรับสินค้าแยกตามสินค้า')]
    Click Element   //li[contains(text(),'รายงานใบรับสินค้าแยกตามสินค้า')]
กดดาวน์โหลดเอกสารรายงานใบรับสินค้าแยกตามสินค้า(แบบละเอียด)
    Wait Until Element Is Visible   //li[contains(text(),'รายงานใบรับสินค้าแยกตามสินค้า (แบบละเอียด)')]
    Click Element   //li[contains(text(),'รายงานใบรับสินค้าแยกตามสินค้า (แบบละเอียด)')]
ปิดpopup
    Take Screenshot    name=screenshot  format=jpg  quality=0
    Wait Until Element Is Visible   //button[@class="btn btn-primary pull-right" and text()='ตกลง']
    Click Element   //button[@class="btn btn-primary pull-right" and text()='ตกลง']

*** Test Cases ***
เข้าเมนู report
   เปิดเว็บ new ui
   เลือก Company
   เลือกเมนู Report
Filter Case Previous day สำหรับยอดขาย มากกว่า90
   เลือกช่วงวันที่มากกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานสรุปยอดขาย
   ปิดpopup
Filter Case This month สำหรับยอดขาย
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานสรุปยอดขาย
Filter Case Previous day สำหรับยอดขาย น้อยกว่า90
   เลือกช่วงวันที่น้อยกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานสรุปยอดขาย
Filter Case This month แบบละเอียด สำหรับยอดขาย
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานสรุปยอดขาย(แบบละเอียด)
Filter Case Previous day สำหรับยอดขาย มากกว่า90 แบบละเอียด
   เลือกช่วงวันที่มากกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานสรุปยอดขาย(แบบละเอียด)
   ปิดpopup
Filter Case Previous month สำหรับยอดขาย
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานสรุปยอดขาย
Filter Case Previous day สำหรับยอดขาย น้อยกว่า90 แบบละเอียด
   เลือกช่วงวันที่น้อยกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานสรุปยอดขาย(แบบละเอียด)
Filter Case Previous month แบบละเอียด สำหรับยอดขาย
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานสรุปยอดขาย(แบบละเอียด)
Filter Case Previous Year สำหรับยอดขาย
   เลือกปีก่อน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานสรุปยอดขาย
   ปิดpopup
Filter Case This Year สำหรับยอดขาย
   เลือกปีปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานสรุปยอดขาย
Filter Case Previous Year แบบละเอียด สำหรับยอดขาย
   เลือกปีก่อน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานสรุปยอดขาย(แบบละเอียด)
   ปิดpopup
Filter Case This Year แบบละเอียด สำหรับยอดขาย
   เลือกปีปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานสรุปยอดขาย(แบบละเอียด)

เข้าเมนู report สำหรับสินค้า
   เลือกเมนูยอดขายตามสินค้า
Filter Case Previous day สำหรับสินค้า มากกว่า90
   เลือกช่วงวันที่มากกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามสินค้า
   ปิดpopup
Filter Case This month สำหรับสินค้า
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามสินค้า
Filter Case Previous day สำหรับสินค้า มากกว่า90 แบบละเอียด
   เลือกช่วงวันที่มากกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามสินค้า(แบบละเอียด)
   ปิดpopup
Filter Case This month แบบละเอียด สำหรับสินค้า
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามสินค้า(แบบละเอียด)
Filter Case Previous month สำหรับสินค้า
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามสินค้า
Filter Case Previous day สำหรับสินค้า น้อยกว่า90
   เลือกช่วงวันที่น้อยกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามสินค้า
Filter Case Previous month แบบละเอียด สำหรับสินค้า
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามสินค้า(แบบละเอียด)
Filter Case Previous day สำหรับสินค้า น้อยกว่า90 แบบละเอียด
   เลือกช่วงวันที่น้อยกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามสินค้า(แบบละเอียด)
Filter Case Previous Year สำหรับสินค้า
   เลือกปีก่อน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามสินค้า
   ปิดpopup
Filter Case This Year สำหรับสินค้า
   เลือกปีปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามสินค้า
Filter Case Previous Year แบบละเอียด สำหรับสินค้า
   เลือกปีก่อน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามสินค้า(แบบละเอียด)
   ปิดpopup
Filter Case This Year แบบละเอียด สำหรับสินค้า
   เลือกปีปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามสินค้า(แบบละเอียด)

เข้าเมนู report สำหรับพนักงาน
   เลือกเมนูยอดขายตามพนักงาน
Filter Case Previous day สำหรับพนักงาน มากกว่า90
   เลือกช่วงวันที่มากกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามพนักงาน
   ปิดpopup
Filter Case This month สำหรับพนักงาน
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามพนักงาน
Filter Case Previous day สำหรับพนักงาน น้อยกว่า90
   เลือกช่วงวันที่น้อยกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามพนักงาน
Filter Case This month แบบละเอียด สำหรับพนักงาน
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามพนักงาน(แบบละเอียด)
Filter Case Previous month สำหรับพนักงาน
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามพนักงาน
Filter Case Previous day สำหรับพนักงาน มากกว่า90 แบบละเอียด
   เลือกช่วงวันที่มากกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามพนักงาน(แบบละเอียด)
   ปิดpopup
Filter Case Previous month แบบละเอียด สำหรับพนักงาน
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามพนักงาน(แบบละเอียด)
Filter Case Previous day สำหรับพนักงาน น้อยกว่า90 แบบละเอียด
   เลือกช่วงวันที่น้อยกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามพนักงาน(แบบละเอียด)
Filter Case Previous Year สำหรับพนักงาน
   เลือกปีก่อน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามพนักงาน
   ปิดpopup
Filter Case This Year สำหรับพนักงาน
   เลือกปีปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามพนักงาน
Filter Case Previous Year แบบละเอียด สำหรับพนักงาน
   เลือกปีก่อน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามพนักงาน(แบบละเอียด)
   ปิดpopup
Filter Case This Year แบบละเอียด สำหรับพนักงาน
   เลือกปีปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามพนักงาน(แบบละเอียด)

เข้าเมนู report สำหรับลูกค้า
   เลือกเมนูยอดขายตามลูกค้า
Filter Case Previous day สำหรับลูกค้า มากกว่า90
   เลือกช่วงวันที่มากกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามลูกค้า
   ปิดpopup
Filter Case This month สำหรับลูกค้า
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามลูกค้า
Filter Case Previous day สำหรับลูกค้า น้อยกว่า90
   เลือกช่วงวันที่น้อยกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามลูกค้า
Filter Case This month แบบละเอียด สำหรับลูกค้า
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามลูกค้า(แบบละเอียด)
Filter Case Previous month สำหรับลูกค้า
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามลูกค้า
Filter Case Previous day สำหรับลูกค้า มากกว่า90 แบบละเอียด
   เลือกช่วงวันที่มากกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามลูกค้า(แบบละเอียด)
   ปิดpopup
Filter Case Previous month แบบละเอียด สำหรับลูกค้า
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามลูกค้า(แบบละเอียด)
Filter Case Previous day สำหรับลูกค้า น้อยกว่า90 แบบละเอียด
   เลือกช่วงวันที่น้อยกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามลูกค้า(แบบละเอียด)
Filter Case Previous Year สำหรับลูกค้า
   เลือกปีก่อน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามลูกค้า
   ปิดpopup
Filter Case This Year สำหรับลูกค้า
   เลือกปีปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามลูกค้า
Filter Case Previous Year แบบละเอียด สำหรับลูกค้า
   เลือกปีก่อน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามลูกค้า(แบบละเอียด)
   ปิดpopup
Filter Case This Year แบบละเอียด สำหรับลูกค้า
   เลือกปีปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสารขาย
   กดดาวน์โหลดเอกสารรายงานยอดขายแยกตามลูกค้า(แบบละเอียด)

เข้าเมนู report สำหรับวางบิล
   เลือกเมนูใบวางบิล
Filter Case Previous day สำหรับวางบิล น้อยกว่า90
   เลือกช่วงวันที่น้อยกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสาร
Filter Case This month สำหรับวางบิล
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสาร
Filter Case Previous month สำหรับวางบิล
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสาร
Filter Case Previous Year สำหรับวางบิล
   เลือกปีก่อน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสาร
   ปิดpopup
Filter Case This Year สำหรับวางบิล
   เลือกปีปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสาร
Filter Case Previous day สำหรับวางบิล มากกว่า90
   เลือกช่วงวันที่มากกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสาร
   ปิดpopup

เข้าเมนู report สำหรับเก็บเงิน
   เลือกเมนูการเก็บเงิน
Filter Case Previous day สำหรับเก็บเงิน มากกว่า90
   เลือกช่วงวันที่มากกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสาร
   ปิดpopup
Filter Case This month สำหรับเก็บเงิน
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสาร
Filter Case Previous month สำหรับเก็บเงิน
   เลือกเดือนปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสาร
Filter Case Previous day สำหรับเก็บเงิน น้อยกว่า90
   เลือกช่วงวันที่น้อยกว่า90
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสาร
Filter Case This Year สำหรับเก็บเงิน
   เลือกปีปัจจุบัน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสาร
Filter Case Previous Year สำหรับเก็บเงิน
   เลือกปีก่อน
   กดแสดงผลรายงาน
   กดดาวน์โหลดเอกสาร
   ปิดpopup

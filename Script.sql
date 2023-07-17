/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     4/28/2021 7:11:30 PM                         */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETHOADON') and o.name = 'FK_CHITIETH_CHITIETHO_HOADON')
alter table CHITIETHOADON
   drop constraint FK_CHITIETH_CHITIETHO_HOADON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETHOADON') and o.name = 'FK_CHITIETH_CHITIETHO_HOCPHAN')
alter table CHITIETHOADON
   drop constraint FK_CHITIETH_CHITIETHO_HOCPHAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DANHSACHLOP') and o.name = 'FK_DANHSACH_DANHSACHL_HOCVIEN')
alter table DANHSACHLOP
   drop constraint FK_DANHSACH_DANHSACHL_HOCVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DANHSACHLOP') and o.name = 'FK_DANHSACH_DANHSACHL_LOP')
alter table DANHSACHLOP
   drop constraint FK_DANHSACH_DANHSACHL_LOP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HOADON') and o.name = 'FK_HOADON_LAP_NHANVIEN')
alter table HOADON
   drop constraint FK_HOADON_LAP_NHANVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HOADON') and o.name = 'FK_HOADON_THANH_TOA_HOCVIEN')
alter table HOADON
   drop constraint FK_HOADON_THANH_TOA_HOCVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KITHI') and o.name = 'FK_KITHI_CO_CHUNGCHI')
alter table KITHI
   drop constraint FK_KITHI_CO_CHUNGCHI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LOP') and o.name = 'FK_LOP_DAY_GIAOVIEN')
alter table LOP
   drop constraint FK_LOP_DAY_GIAOVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LOP') and o.name = 'FK_LOP_HOAT__ONG_PHONGHOC')
alter table LOP
   drop constraint FK_LOP_HOAT__ONG_PHONGHOC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LOP') and o.name = 'FK_LOP_NAM_TRONG_KHOAHOC')
alter table LOP
   drop constraint FK_LOP_NAM_TRONG_KHOAHOC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LOP') and o.name = 'FK_LOP_THUOC_HOCPHAN')
alter table LOP
   drop constraint FK_LOP_THUOC_HOCPHAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LOP') and o.name = 'FK_LOP_XEP_LICH_NHANVIEN')
alter table LOP
   drop constraint FK_LOP_XEP_LICH_NHANVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUDUTHI') and o.name = 'FK_PHIEUDUT_CUA_HOCVIEN')
alter table PHIEUDUTHI
   drop constraint FK_PHIEUDUT_CUA_HOCVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUDUTHI') and o.name = 'FK_PHIEUDUT_THAM_DU_KITHI')
alter table PHIEUDUTHI
   drop constraint FK_PHIEUDUT_THAM_DU_KITHI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('YEUCAUHOCPHAN') and o.name = 'FK_YEUCAUHO_YC1_HOCPHAN')
alter table YEUCAUHOCPHAN
   drop constraint FK_YEUCAUHO_YC1_HOCPHAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('YEUCAUHOCPHAN') and o.name = 'FK_YEUCAUHO_YC2_HOCPHAN')
alter table YEUCAUHOCPHAN
   drop constraint FK_YEUCAUHO_YC2_HOCPHAN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETHOADON')
            and   name  = 'CHITIETHOADON2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETHOADON.CHITIETHOADON2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETHOADON')
            and   name  = 'CHITIETHOADON_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETHOADON.CHITIETHOADON_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHITIETHOADON')
            and   type = 'U')
   drop table CHITIETHOADON
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHUNGCHIQUOCTE')
            and   type = 'U')
   drop table CHUNGCHIQUOCTE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DANHSACHLOP')
            and   name  = 'DANHSACHLOP2_FK'
            and   indid > 0
            and   indid < 255)
   drop index DANHSACHLOP.DANHSACHLOP2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DANHSACHLOP')
            and   name  = 'DANHSACHLOP_FK'
            and   indid > 0
            and   indid < 255)
   drop index DANHSACHLOP.DANHSACHLOP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DANHSACHLOP')
            and   type = 'U')
   drop table DANHSACHLOP
go

if exists (select 1
            from  sysobjects
           where  id = object_id('GIAOVIEN')
            and   type = 'U')
   drop table GIAOVIEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HOADON')
            and   name  = 'LAP_FK'
            and   indid > 0
            and   indid < 255)
   drop index HOADON.LAP_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HOADON')
            and   name  = 'THANH_TOAN_FK'
            and   indid > 0
            and   indid < 255)
   drop index HOADON.THANH_TOAN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HOADON')
            and   type = 'U')
   drop table HOADON
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HOCPHAN')
            and   type = 'U')
   drop table HOCPHAN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HOCVIEN')
            and   type = 'U')
   drop table HOCVIEN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KHOAHOC')
            and   type = 'U')
   drop table KHOAHOC
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KITHI')
            and   name  = 'CO_FK'
            and   indid > 0
            and   indid < 255)
   drop index KITHI.CO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KITHI')
            and   type = 'U')
   drop table KITHI
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LOP')
            and   name  = 'XEP_LICH_FK'
            and   indid > 0
            and   indid < 255)
   drop index LOP.XEP_LICH_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LOP')
            and   name  = 'NAM_TRONG_FK'
            and   indid > 0
            and   indid < 255)
   drop index LOP.NAM_TRONG_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LOP')
            and   name  = 'HOAT__ONG_FK'
            and   indid > 0
            and   indid < 255)
   drop index LOP.HOAT__ONG_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LOP')
            and   name  = 'DAY_FK'
            and   indid > 0
            and   indid < 255)
   drop index LOP.DAY_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LOP')
            and   name  = 'THUOC_FK'
            and   indid > 0
            and   indid < 255)
   drop index LOP.THUOC_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOP')
            and   type = 'U')
   drop table LOP
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHANVIEN')
            and   type = 'U')
   drop table NHANVIEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUDUTHI')
            and   name  = 'THAM_DU_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUDUTHI.THAM_DU_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUDUTHI')
            and   name  = 'CUA_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUDUTHI.CUA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEUDUTHI')
            and   type = 'U')
   drop table PHIEUDUTHI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHONGHOC')
            and   type = 'U')
   drop table PHONGHOC
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('YEUCAUHOCPHAN')
            and   name  = 'YEUCAUHOCPHAN2_FK'
            and   indid > 0
            and   indid < 255)
   drop index YEUCAUHOCPHAN.YEUCAUHOCPHAN2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('YEUCAUHOCPHAN')
            and   name  = 'YEUCAUHOCPHAN_FK'
            and   indid > 0
            and   indid < 255)
   drop index YEUCAUHOCPHAN.YEUCAUHOCPHAN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('YEUCAUHOCPHAN')
            and   type = 'U')
   drop table YEUCAUHOCPHAN
go

/*==============================================================*/
/* Table: CHITIETHOADON                                         */
/*==============================================================*/
create table CHITIETHOADON (
   MAHD                 varchar(10)          not null,
   MAHP                 varchar(10)          not null,
   DONGIA               money                not null,
   constraint PK_CHITIETHOADON primary key (MAHD, MAHP)
)
go

/*==============================================================*/
/* Index: CHITIETHOADON_FK                                      */
/*==============================================================*/
create index CHITIETHOADON_FK on CHITIETHOADON (
MAHD ASC
)
go

/*==============================================================*/
/* Index: CHITIETHOADON2_FK                                     */
/*==============================================================*/
create index CHITIETHOADON2_FK on CHITIETHOADON (
MAHP ASC
)
go

/*==============================================================*/
/* Table: CHUNGCHIQUOCTE                                        */
/*==============================================================*/
create table CHUNGCHIQUOCTE (
   MACC                 varchar(10)          not null,
   TENCC                nvarchar(100)        not null,
   GIATHI               money                not null,
   constraint PK_CHUNGCHIQUOCTE primary key nonclustered (MACC)
)
go

/*==============================================================*/
/* Table: DANHSACHLOP                                           */
/*==============================================================*/
create table DANHSACHLOP (
   MAHV                 varchar(10)          not null,
   MALOP                varchar(10)          not null,
   DIEM					float				 ,
   KETQUAHP             varchar(1)           ,
   constraint PK_DANHSACHLOP primary key (MAHV, MALOP)
)
go

/*==============================================================*/
/* Index: DANHSACHLOP_FK                                        */
/*==============================================================*/
create index DANHSACHLOP_FK on DANHSACHLOP (
MAHV ASC
)
go

/*==============================================================*/
/* Index: DANHSACHLOP2_FK                                       */
/*==============================================================*/
create index DANHSACHLOP2_FK on DANHSACHLOP (
MALOP ASC
)
go

/*==============================================================*/
/* Table: GIAOVIEN                                              */
/*==============================================================*/
create table GIAOVIEN (
   MAGV                 varchar(10)          not null,
   TENGV                nvarchar(255)        not null,
   NGAYSINHGV           datetime             not null,
   SDT_GV               varchar(10)          not null,
   GIOITINHGV           varchar(1)           not null,
   DIACHIGV             nvarchar(255)        not null,
   CMND_GV              varchar(10)          not null,
   constraint PK_GIAOVIEN primary key nonclustered (MAGV)
)
go

/*==============================================================*/
/* Table: HOADON                                                */
/*==============================================================*/
create table HOADON (
   MAHD                 varchar(10)          not null,
   MANV                 varchar(10)          not null,
   MAHV                 varchar(10)          not null,
   NGAYLAPHD            datetime             not null,
   TONGSOHOCPHAN        int                  not null,
   TONGTIEN             money                not null,
   HINHTHUC				nvarchar(20)		 not null,
   TRANGTHAI            nvarchar(5)          not null,
   constraint PK_HOADON primary key nonclustered (MAHD)
)
go

/*==============================================================*/
/* Index: THANH_TOAN_FK                                         */
/*==============================================================*/
create index THANH_TOAN_FK on HOADON (
MAHV ASC
)
go

/*==============================================================*/
/* Index: LAP_FK                                                */
/*==============================================================*/
create index LAP_FK on HOADON (
MANV ASC
)
go

/*==============================================================*/
/* Table: HOCPHAN                                               */
/*==============================================================*/
create table HOCPHAN (
   MAHP                 varchar(10)          not null,
   TENHP                nvarchar(255)        not null,
   DONGIA               money                not null,
   MOTA                 nvarchar(255)        not null,
   constraint PK_HOCPHAN primary key nonclustered (MAHP)
)
go

/*==============================================================*/
/* Table: HOCVIEN                                               */
/*==============================================================*/
create table HOCVIEN (
   MAHV                 varchar(10)          not null,
   TENHV                nvarchar(255)        not null,
   NGAYSINHHV           datetime             not null,
   DIACHIHV             nvarchar(255)        not null,
   CMND_HV              varchar(10)          not null,
   SDT_HV              varchar(10)          not null,
   GioiTinh_HV              nvarchar(10)          not null,
   constraint PK_HOCVIEN primary key nonclustered (MAHV)
)
go

/*==============================================================*/
/* Table: KHOAHOC                                               */
/*==============================================================*/
create table KHOAHOC (
   MAKH                 varchar(10)          not null,
   SOHOCPHAN            int                  not null,
   TENKH                nvarchar(255)        not null,
   NGAYBATDAU			date				 not null,
   constraint PK_KHOAHOC primary key nonclustered (MAKH)
)
go

/*==============================================================*/
/* Table: KITHI                                                 */
/*==============================================================*/
create table KITHI (
   MAKT                 varchar(10)          not null,
   MACC                 varchar(10)          not null,
   NGAYTHI              date             not null,
   SLDUTHI              int                  not null,
   THOIGIAN             varchar(100)         not null,
   constraint PK_KITHI primary key nonclustered (MAKT)
)
go

/*==============================================================*/
/* Index: CO_FK                                                 */
/*==============================================================*/
create index CO_FK on KITHI (
MACC ASC
)
go

/*==============================================================*/
/* Table: LOP                                                   */
/*==============================================================*/
create table LOP (
   MALOP                varchar(10)          not null,
   MAPH                 varchar(10)          not null,
   MAGV                 varchar(10)          not null,
   MAKH                 varchar(10)          not null,
   MANV                 varchar(10)          null,
   MAHP                 varchar(10)          not null,
   SISOLOP              int                  not null,
   GIOHOC               varchar(30)          not null,
   constraint PK_LOP primary key nonclustered (MALOP)
)
go

/*==============================================================*/
/* Index: THUOC_FK                                              */
/*==============================================================*/
create index THUOC_FK on LOP (
MAHP ASC
)
go

/*==============================================================*/
/* Index: DAY_FK                                                */
/*==============================================================*/
create index DAY_FK on LOP (
MAGV ASC
)
go

/*==============================================================*/
/* Index: HOAT__ONG_FK                                          */
/*==============================================================*/
create index HOAT__ONG_FK on LOP (
MAPH ASC
)
go

/*==============================================================*/
/* Index: NAM_TRONG_FK                                          */
/*==============================================================*/
create index NAM_TRONG_FK on LOP (
MAKH ASC
)
go

/*==============================================================*/
/* Index: XEP_LICH_FK                                           */
/*==============================================================*/
create index XEP_LICH_FK on LOP (
MANV ASC
)
go

/*==============================================================*/
/* Table: NHANVIEN                                              */
/*==============================================================*/
create table NHANVIEN (
   MANV                 varchar(10)          not null,
   HOTENNV              nvarchar(255)        not null,
   CMND_NV              varchar(10)          not null,
   SDT_NV               varchar(10)          not null,
   NGAYSINHNV           datetime             not null,
   GIOITINHNV           varchar(1)           not null,
   DIACHINV             nvarchar(255)        not null,
   CHUCVU               nvarchar(255)        not null,
   constraint PK_NHANVIEN primary key nonclustered (MANV)
)
go

/*==============================================================*/
/* Table: PHIEUDUTHI                                            */
/*==============================================================*/
create table PHIEUDUTHI (
   MAPDT                varchar(10)          not null,
   MAHV                 varchar(10)          not null,
   MAKT                 varchar(10)          not null,
   HOTENTS              nvarchar(255)        not null,
   NGAYSINHTS           datetime             not null,
   DIACHITS             nvarchar(255)        not null,
   CMND_TS              varchar(10)          not null,
   KETQUACC             varchar(5)           not null,
   constraint PK_PHIEUDUTHI primary key nonclustered (MAPDT)
)
go

/*==============================================================*/
/* Index: CUA_FK                                                */
/*==============================================================*/
create index CUA_FK on PHIEUDUTHI (
MAHV ASC
)
go

/*==============================================================*/
/* Index: THAM_DU_FK                                            */
/*==============================================================*/
create index THAM_DU_FK on PHIEUDUTHI (
MAKT ASC
)
go

/*==============================================================*/
/* Table: PHONGHOC                                              */
/*==============================================================*/
create table PHONGHOC (
   MAPH                 varchar(10)          not null,
   TENPH                nvarchar(255)        not null,
   KHUVUC               char(1)              not null,
   constraint PK_PHONGHOC primary key nonclustered (MAPH)
)
go

/*==============================================================*/
/* Table: YEUCAUHOCPHAN                                         */
/*==============================================================*/
create table YEUCAUHOCPHAN (
   HOC_MAHP             varchar(10)          not null,
   MAHP                 varchar(10)          not null,
   constraint PK_YEUCAUHOCPHAN primary key (HOC_MAHP, MAHP)
)
go

/*==============================================================*/
/* Index: YEUCAUHOCPHAN_FK                                      */
/*==============================================================*/
create index YEUCAUHOCPHAN_FK on YEUCAUHOCPHAN (
HOC_MAHP ASC
)
go

/*==============================================================*/
/* Index: YEUCAUHOCPHAN2_FK                                     */
/*==============================================================*/
create index YEUCAUHOCPHAN2_FK on YEUCAUHOCPHAN (
MAHP ASC
)
go

alter table CHITIETHOADON
   add constraint FK_CHITIETH_CHITIETHO_HOADON foreign key (MAHD)
      references HOADON (MAHD)
go

alter table CHITIETHOADON
   add constraint FK_CHITIETH_CHITIETHO_HOCPHAN foreign key (MAHP)
      references HOCPHAN (MAHP)
go

alter table DANHSACHLOP
   add constraint FK_DANHSACH_DANHSACHL_HOCVIEN foreign key (MAHV)
      references HOCVIEN (MAHV)
go

alter table DANHSACHLOP
   add constraint FK_DANHSACH_DANHSACHL_LOP foreign key (MALOP)
      references LOP (MALOP)
go

alter table HOADON
   add constraint FK_HOADON_LAP_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go

alter table HOADON
   add constraint FK_HOADON_THANH_TOA_HOCVIEN foreign key (MAHV)
      references HOCVIEN (MAHV)
go

alter table KITHI
   add constraint FK_KITHI_CO_CHUNGCHI foreign key (MACC)
      references CHUNGCHIQUOCTE (MACC)
go

alter table LOP
   add constraint FK_LOP_DAY_GIAOVIEN foreign key (MAGV)
      references GIAOVIEN (MAGV)
go

alter table LOP
   add constraint FK_LOP_HOAT__ONG_PHONGHOC foreign key (MAPH)
      references PHONGHOC (MAPH)
go

alter table LOP
   add constraint FK_LOP_NAM_TRONG_KHOAHOC foreign key (MAKH)
      references KHOAHOC (MAKH)
go

alter table LOP
   add constraint FK_LOP_THUOC_HOCPHAN foreign key (MAHP)
      references HOCPHAN (MAHP)
go

alter table LOP
   add constraint FK_LOP_XEP_LICH_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go

alter table PHIEUDUTHI
   add constraint FK_PHIEUDUT_CUA_HOCVIEN foreign key (MAHV)
      references HOCVIEN (MAHV)
go

alter table PHIEUDUTHI
   add constraint FK_PHIEUDUT_THAM_DU_KITHI foreign key (MAKT)
      references KITHI (MAKT)
go

alter table YEUCAUHOCPHAN
   add constraint FK_YEUCAUHO_YC1_HOCPHAN foreign key (HOC_MAHP)
      references HOCPHAN (MAHP)
go

alter table YEUCAUHOCPHAN
   add constraint FK_YEUCAUHO_YC2_HOCPHAN foreign key (MAHP)
      references HOCPHAN (MAHP)
go


alter table CHITIETHOADON
   add constraint FK_CHITIETH_CHITIETHO_HOADON foreign key (MAHD)
      references HOADON (MAHD)
go
alter table CHITIETHOADON
   add constraint FK_CHITIETH_CHITIETHO_HOCPHAN foreign key (MAHP)
      references HOCPHAN (MAHP)
go
alter table DANHSACHLOP
   add constraint FK_DANHSACH_DANHSACHL_HOCVIEN foreign key (MAHV)
      references HOCVIEN (MAHV)
go
alter table DANHSACHLOP
   add constraint FK_DANHSACH_DANHSACHL_LOP foreign key (MALOP)
      references LOP (MALOP)
go
alter table HOADON
   add constraint FK_HOADON_LAP_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go
alter table HOADON
   add constraint FK_HOADON_THANH_TOA_HOCVIEN foreign key (MAHV)
      references HOCVIEN (MAHV)
go
alter table KITHI
   add constraint FK_KITHI_CO_CHUNGCHI foreign key (MACC)
      references CHUNGCHIQUOCTE (MACC)
go
alter table LOP
   add constraint FK_LOP_DAY_GIAOVIEN foreign key (MAGV)
      references GIAOVIEN (MAGV)
go
alter table LOP
   add constraint FK_LOP_HOAT__ONG_PHONGHOC foreign key (MAPH)
      references PHONGHOC (MAPH)
go
alter table LOP
   add constraint FK_LOP_NAM_TRONG_KHOAHOC foreign key (MAKH)
      references KHOAHOC (MAKH)
go
alter table LOP
   add constraint FK_LOP_THUOC_HOCPHAN foreign key (MAHP)
      references HOCPHAN (MAHP)
go
alter table LOP
   add constraint FK_LOP_XEP_LICH_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go
alter table PHIEUDUTHI
   add constraint FK_PHIEUDUT_CUA_HOCVIEN foreign key (MAHV)
      references HOCVIEN (MAHV)
go
alter table PHIEUDUTHI
   add constraint FK_PHIEUDUT_THAM_DU_KITHI foreign key (MAKT)
      references KITHI (MAKT)
go
alter table YEUCAUHOCPHAN
   add constraint FK_YEUCAUHO_YC1_HOCPHAN foreign key (HOC_MAHP)
      references HOCPHAN (MAHP)
go
alter table YEUCAUHOCPHAN
   add constraint FK_YEUCAUHO_YC2_HOCPHAN foreign key (MAHP)
      references HOCPHAN (MAHP)
go

--=====================================Nhap lieu============================================

insert into HOCPHAN values ('HP01', N'HỌC PHẦN 01', 700000, 'ABC');
insert into HOCPHAN values ('HP02', N'HỌC PHẦN 02', 100000, 'ABC');
insert into HOCPHAN values ('HP03', N'HỌC PHẦN 03', 200000, 'ABC');
insert into HOCPHAN values ('HP04', N'HỌC PHẦN 04', 500000, 'ABC');
insert into HOCPHAN values ('HP05', N'HỌC PHẦN 05', 800000, 'ABC');

insert into GIAOVIEN values ('GV01', 'AN', '01-01-1980', '0963214587' , 'M', '123 ABC', '0159632478');
insert into GIAOVIEN values ('GV02', 'BA', '02-02-1981', '0963214584' , 'M', '124 ADC', '0159632471');
insert into GIAOVIEN values ('GV03', 'CA', '03-03-1982', '0963214585' , 'F', '125 SAC', '0159632476');
insert into GIAOVIEN values ('GV04', 'DA', '04-04-1983', '0963214582' , 'F', '126 BFC', '0159632477');
insert into GIAOVIEN values ('GV05', 'NA', '05-05-1984', '0963214586' , 'M', '127 AGF', '0159632472');

insert into NHANVIEN values ('NV01', N'NHÂN VIÊN 01', '1', '4561237890', '03-03-2000' , 'F', 'ABC', N'NHÂN VIÊN');
insert into NHANVIEN values ('NV02', N'NHÂN VIÊN 02', '2587413691', '4561237894', '04-03-2000' , 'F', 'AGC', N'NHÂN VIÊN');
insert into NHANVIEN values ('NV03', N'NHÂN VIÊN 03', '2587413692', '4561237895', '05-03-2000' , 'F', 'AEC', N'NHÂN VIÊN');
insert into NHANVIEN values ('NV04', N'NHÂN VIÊN 04', '2587413699', '4561237897', '06-03-2000' , 'F', 'ABW', N'NHÂN VIÊN');
insert into NHANVIEN values ('NV05', N'NHÂN VIÊN 05', '2587413695', '4561237891', '07-03-2000' , 'F', 'ABV', N'NHÂN VIÊN');

insert into HOCVIEN values ('HV01', N'HỌC VIÊN 01', '05-05-2000', 'ABC', '0134679852','0908313245',N'Nam');
insert into HOCVIEN values ('HV02', N'HỌC VIÊN 02', '04-05-2000', 'ARC', '0134679858','0906341364',N'Nữ');
insert into HOCVIEN values ('HV03', N'HỌC VIÊN 03', '03-05-2000', 'AWC', '0134679857','0903134123',N'Nam');
insert into HOCVIEN values ('HV04', N'HỌC VIÊN 04', '02-05-2000', 'ANC', '0134679856','0903625314',N'Nữ');
insert into HOCVIEN values ('HV05', N'HỌC VIÊN 05', '01-05-2000', 'AZC', '0134679853','0903153234',N'Nam');

insert into HOADON values ('HD01', 'NV01', 'HV01', '12-12-2020' , 1, 900000,N'Tiền mặt', 'DONE');
insert into HOADON values ('HD02', 'NV02', 'HV02', '11-12-2020' , 2, 600000,N'Thẻ', 'DONE');
insert into HOADON values ('HD03', 'NV03', 'HV03', '10-12-2020' , 3, 100000,N'Tiền mặt', 'DONE');
insert into HOADON values ('HD04', 'NV04', 'HV04', '09-12-2020' , 4, 500000,N'Thẻ', 'DONE');
insert into HOADON values ('HD05', 'NV05', 'HV05', '08-12-2020' , 5, 700000,N'Tiền mặt', 'DONE');

insert into CHITIETHOADON values ('HD01', 'HP01', 900000);
insert into CHITIETHOADON values ('HD02', 'HP02', 800000);
insert into CHITIETHOADON values ('HD01', 'HP03', 700000);
insert into CHITIETHOADON values ('HD04', 'HP04', 600000);
insert into CHITIETHOADON values ('HD05', 'HP05', 500000);

insert into CHUNGCHIQUOCTE values ('001A', N'CHỨNG CHỈ 01', 900000);
insert into CHUNGCHIQUOCTE values ('002B', N'CHỨNG CHỈ 02', 800000);
insert into CHUNGCHIQUOCTE values ('003C', N'CHỨNG CHỈ 03', 700000);
insert into CHUNGCHIQUOCTE values ('004D', N'CHỨNG CHỈ 04', 600000);
insert into CHUNGCHIQUOCTE values ('005E', N'CHỨNG CHỈ 05', 500000);

insert into KHOAHOC values ('KH01', 1, N'KHÓA HỌC 01','1-22-2018');
insert into KHOAHOC values ('KH02', 2, N'KHÓA HỌC 02','2-22-2019');
insert into KHOAHOC values ('KH03', 3, N'KHÓA HỌC 03','3-13-2019');
insert into KHOAHOC values ('KH04', 4, N'KHÓA HỌC 04','1-16-2020');
insert into KHOAHOC values ('KH05', 5, N'KHÓA HỌC 05','5-1-2021');

insert into PHONGHOC values ('I44', 'CNTT', 'I');
insert into PHONGHOC values ('B11', 'IOT', 'B');
insert into PHONGHOC values ('I12', 'CNSH', 'I');
insert into PHONGHOC values ('C23', 'CNTP', 'C');
insert into PHONGHOC values ('I41', 'HCMUS', 'I');

insert into LOP values ('LOP01', 'I44', 'GV01', 'KH01', 'NV01' , 'HP01', 30, '7h30-10h30');
insert into LOP values ('LOP02', 'B11', 'GV02', 'KH02', 'NV02' , 'HP02', 27, '7h30-10h30');
insert into LOP values ('LOP03', 'I12', 'GV03', 'KH03', 'NV03' , 'HP03', 30, '7h30-10h30');
insert into LOP values ('LOP04', 'C23', 'GV04', 'KH04', 'NV04' , 'HP04', 29, '7h30-10h30');
insert into LOP values ('LOP05', 'I41', 'GV05', 'KH05', 'NV05' , 'HP05', 30, '7h30-10h30');

insert into DANHSACHLOP values ('HV01', 'LOP01',9.5,N'Đ');
insert into DANHSACHLOP values ('HV02', 'LOP01',3.5,N'R');
insert into DANHSACHLOP values ('HV03', 'LOP01',2.5,N'R');
insert into DANHSACHLOP values ('HV04', 'LOP01',5.5,N'Đ');
insert into DANHSACHLOP values ('HV05', 'LOP01',8.5,N'Đ');

insert into KITHI values ('KT01', '001A', '04-04-2020', 34, '8h30-10h30');
insert into KITHI values ('KT02', '002B', '05-04-2020', 21, '8h30-10h30');
insert into KITHI values ('KT03', '003C', '06-04-2020', 17, '8h30-10h30');
insert into KITHI values ('KT04', '004D', '07-04-2020', 40, '8h30-10h30');
insert into KITHI values ('KT05', '004D', '08-04-2020', 35, '8h30-10h30');

insert into PHIEUDUTHI values ('PDT01', 'HV01', 'KT01', N'HỌC VIÊN 01', '03-05-2000', 'ABC', '4879650213', '1');
insert into PHIEUDUTHI values ('PDT02', 'HV02', 'KT02', N'HỌC VIÊN 02', '09-05-2000', 'ADC', '4879650218', '1');
insert into PHIEUDUTHI values ('PDT03', 'HV03', 'KT03', N'HỌC VIÊN 03', '08-05-2000', 'ABC', '4879650217', '1');
insert into PHIEUDUTHI values ('PDT04', 'HV04', 'KT04', N'HỌC VIÊN 04', '04-05-2000', 'ATC', '4879650211', '1');
insert into PHIEUDUTHI values ('PDT05', 'HV05', 'KT05', N'HỌC VIÊN 05', '01-05-2000', 'ABR', '4879650212', '1');

insert into YEUCAUHOCPHAN values ('HP05', 'HP01');
insert into YEUCAUHOCPHAN values ('HP05', 'HP02');
insert into YEUCAUHOCPHAN values ('HP05', 'HP03');
insert into YEUCAUHOCPHAN values ('HP04', 'HP05');


--PROC
--Tìm học viên theo tên
go
create procedure TimHocVien @hocvien nvarchar(50)
as
begin
	select * from HOCVIEN where TENHV like '%'+@hocvien+'%'
end
go
--Hiển thị danh sách lớp
create procedure HienDanhSachLop
as
begin
	select * from LOP
end
go
--Check đăng nhập
CREATE PROC DangNhap(@manv varchar(10), @cmmnd varchar(10))
AS 
BEGIN
	SELECT * -- có thì là 1, không thì là 0
	FROM NHANVIEN
	WHERE MANV = @manv and @cmmnd = CMND_NV
END;
GO
--Chứng chỉ quốc tế
CREATE PROC ChiTietCCQT
AS 
BEGIN
	SELECT KT.MAKT,CC.TENCC, KT.NGAYTHI, KT.THOIGIAN, CC.GIATHI
	FROM CHUNGCHIQUOCTE CC, KITHI KT
	WHERE CC.MACC = KT.MACC AND KT.NGAYTHI < GETDATE()
END;
GO

--Xem kết quả học phần của học viên
CREATE PROC XemKetQuaHV(@mahv varchar(10))
AS
BEGIN
	SELECT HP.TENHP, DSL.DIEM,DSL.KETQUAHP
	FROM DANHSACHLOP DSL, HOCVIEN HV, LOP L, HOCPHAN HP
	WHERE	HV.MAHV = DSL.MAHV AND 
			DSL.MALOP = L.MALOP AND 
			L.MAHP = HP.MAHP AND
			@mahv = HV.MAHV
END;
GO
--Tạo thời khóa biểu, tạo lớp
CREATE PROC LapTKB(@malop varchar(10),@maph varchar(10), @magv varchar(10), @manv varchar(10), @mahp varchar(10), @sisolop int, @giohoc varchar(30))
AS
BEGIN
	DECLARE @so int,@makh varchar(10)
	set @makh = (select MAKH from KHOAHOC where NGAYBATDAU = (select Max(NGAYBATDAU) from KHOAHOC))
	INSERT INTO LOP VALUES (@malop,@maph, @magv, @makh, @manv, @mahp, @sisolop, @giohoc)
END;
GO
--Danh sách lớp học phần đang mở
CREATE PROC DanhSachLopHocPhan
AS
BEGIN
	SELECT L.MALOP, HP.MAHP, HP.TENHP, L.SISOLOP, COUNT(DSL.MALOP) AS DaDangKy, HP.MOTA
	FROM LOP L LEFT JOIN DANHSACHLOP DSL ON L.MALOP = DSL.MALOP, HOCPHAN HP
	WHERE HP.MAHP = L.MAHP
	GROUP BY L.MALOP, HP.MAHP, HP.TENHP, L.SISOLOP, HP.MOTA
END;
GO
--Danh sách lớp học phần đang mở theo tên học phần hoặc mã lớp
CREATE PROC DanhSachLopHocPhanDK(@input nvarchar(100))
AS
BEGIN
	SELECT L.MALOP, HP.MAHP, HP.TENHP, L.SISOLOP, COUNT(DSL.MALOP) AS DaDangKy, HP.MOTA
	FROM LOP L LEFT JOIN DANHSACHLOP DSL ON L.MALOP = DSL.MALOP, HOCPHAN HP
	WHERE HP.MAHP = L.MAHP and (L.MALOP like '%'+@input+'%' or TENHP like '%'+@input+'%')
	GROUP BY L.MALOP, HP.MAHP, HP.TENHP, L.SISOLOP, HP.MOTA
END;
GO
--Truy vấn hóa đơn
/*Mode
1. tìm tất cả
2. tìm hoàn tất/chưa hoàn tất
3. tìm tất cả + tên hd (dùng like %ten%)
4. tìm hoàn tất/chưa hoàn tất + tên hd (dùng like %ten%)
*/  
CREATE PROC TruyVanHoaDon(@input nvarchar(50),@trangthai nvarchar(5), @mode int)
AS
BEGIN
	IF(@mode = 1)
	BEGIN
		SELECT a.*,b.TENHV
		FROM HOADON a, HOCVIEN b
		where a.MAHV=b.MAHV
	END
	IF(@mode = 2)
	BEGIN
		SELECT a.*,b.TENHV
		FROM HOADON a, HOCVIEN b
		WHERE @trangthai = TRANGTHAI and a.MAHV=b.MAHV
	END
	IF(@mode = 3)
	BEGIN
		SELECT a.*,b.TENHV
		FROM HOADON a, HOCVIEN b
		WHERE (TENHV LIKE '%' +  @input + '%') and a.MAHV=b.MAHV 
	END
	IF(@mode = 4)
	BEGIN
		SELECT a.*,b.TENHV
		FROM HOADON a, HOCVIEN b
		WHERE (TENHV LIKE '%' +  @input + '%') and @trangthai = TRANGTHAI and a.MAHV=b.MAHV
	END
END;
GO
--Xem chi tiet hoa don
CREATE PROC Xemchitiethoadon(@mahd varchar(10))
AS
BEGIN
	select b.* from CHITIETHOADON a,HOCPHAN b where a.MAHP=b.MAHP and a.MAHD=@mahd;
END;
GO
--Thanh toán hóa đơn
CREATE PROC ThanhToan(@madh varchar(10))
AS
BEGIN
	UPDATE HOADON SET TRANGTHAI = 'DONE' WHERE @madh = MAHD
END;
GO

--Thêm học viên  = Insert 1 học viên với Mã HV là autoincremen
CREATE PROC ThemHocVien(@hoten nvarchar(255), @ngaysinh datetime, @diachi nvarchar(255), @cmnd varchar(10), @sdt varchar(10), @gioitinh nvarchar(10))
AS
BEGIN
	DECLARE @so int
	SET @so = (SELECT COUNT(*)+1 FROM HOCVIEN) --Tăng 1 số so với MaHV cuối cùng
	INSERT INTO HOCVIEN VALUES (CONCAT('HV', @so),@hoten, @ngaysinh, @diachi, @cmnd, @sdt, @gioitinh)
END;
GO

--Đăng ký học = Insert 1 lớp với Mã lớp là autoincremen
CREATE PROC DangKyHoc(@mahv varchar(10), @malop varchar(10))
AS
BEGIN
	--Lấy mã học phần từ mã lớp
	DECLARE @mahp varchar(10)
	SET @mahp = (SELECT MAHP FROM LOP WHERE MALOP = @malop)
	
	--Học phần cần thiết
	DECLARE @tb1 table (HOCPHAN varchar(10));
	INSERT INTO @tb1 SELECT MAHP FROM YEUCAUHOCPHAN WHERE HOC_MAHP = @mahp

	--Học phần học viên đã học
	DECLARE @tb2 table (HOCPHAN varchar(10));
	INSERT INTO @tb2 SELECT HP.MAHP FROM DANHSACHLOP DSL, HOCVIEN HV, LOP L, HOCPHAN HP WHERE	HV.MAHV = DSL.MAHV AND DSL.MALOP = L.MALOP AND L.MAHP = HP.MAHP AND @mahv = HV.MAHV

	DECLARE @count1 int
	DECLARE @count2 int
	SET @count1 = (SELECT COUNT(*) FROM @tb1)
	SET @count2 = (SELECT COUNT(*) FROM @tb1 tb1 JOIN @tb2 tb2 ON tb1.HOCPHAN = tb2.HOCPHAN)

	--Nếu số học phần cần thiết = số học phần học viên học JOIN với học phần cần thiết thì hợp lệ
	IF(@count1 = @count2)
		INSERT INTO DANHSACHLOP VALUES (@mahv, @malop,null,null); -- chỗ này '0' là kết quả, sửa thành điểm nhớ sửa lại
	ELSE
		Raiserror('KHONG DU DIEU KIEN',12,0);
END;
GO

--Lập phiếu dự thi chứng chỉ = Insert 1 phiếu dự thi với Mã PDT là autoincremen
CREATE PROC LapPDT(@mahv varchar(10), @makt varchar(10))
AS
BEGIN
	DECLARE @count int
	SET @count = (SELECT COUNT(*) FROM PHIEUDUTHI WHERE @mahv = MAHV AND @makt = MAKT)
	IF(@count = 0)
	BEGIN
		DECLARE @so int
		SET @so = (SELECT COUNT(*)+1 FROM PHIEUDUTHI)

		DECLARE @hoten nvarchar(255)
		SET @hoten = (SELECT TENHV FROM HOCVIEN WHERE MAHV = @mahv)
		DECLARE @ngaysinh datetime
		SET @ngaysinh = (SELECT NGAYSINHHV FROM HOCVIEN WHERE MAHV = @mahv)
		DECLARE @diachi nvarchar(255)
		SET @diachi = (SELECT DIACHIHV FROM HOCVIEN WHERE MAHV = @mahv)
		DECLARE @cmnd varchar(10)
		SET @cmnd = (SELECT CMND_HV FROM HOCVIEN WHERE MAHV = @mahv)

		INSERT INTO PHIEUDUTHI VALUES (CONCAT('PDT', @so),@mahv, @makt, @hoten, @ngaysinh, @diachi, @cmnd, '0'); -- chỗ này '0' là kết quả, sửa thành điểm nhớ sửa lại
	END
	IF(@count = 1)
		Raiserror('HOC VIEN DA DANG KY KY THI NAY',12,0);
END;
GO

--Thêm học phần
CREATE PROC ThemHP(@tenhp nvarchar(255), @dongia money, @mota nvarchar(255))
AS
BEGIN
	DECLARE @so int
	SET @so = (SELECT COUNT(*)+1 FROM HOCPHAN)
	INSERT INTO HOCPHAN VALUES (CONCAT('HP', @so), @tenhp, @dongia, @mota)
END;
GO

--Thống kê học phần sinh viên học nhiều nhất
CREATE PROC ThongKeHP
AS
BEGIN
	SELECT HP.MAHP, HP.TENHP, COUNT(DSL.MAHV) AS SoLuongHV
	FROM (HOCPHAN HP LEFT JOIN LOP L ON L.MAHP = HP.MAHP) LEFT JOIN DANHSACHLOP DSL ON DSL.MALOP = L.MALOP
	GROUP BY HP.MAHP, HP.TENHP
	ORDER BY COUNT(DSL.MAHV) DESC
END;
GO


--Thống kê chứng chỉ thi nhiều nhất
CREATE PROC ThongKeCC
AS
BEGIN
	SELECT CC.MACC, CC.TENCC, COUNT(PDT.MAHV) AS SoLuongHV
	FROM (CHUNGCHIQUOCTE CC LEFT JOIN KITHI KT ON CC.MACC = KT.MACC) LEFT JOIN PHIEUDUTHI PDT ON PDT.MAKT = KT.MAKT
	GROUP BY CC.MACC, CC.TENCC
	ORDER BY COUNT(PDT.MAHV) DESC
END;
GO

--Thống kê PDT theo 2 mode
-- 1 là tất cà
-- 2 là theo tên
CREATE PROCEDURE ThongKePDT(@tents nvarchar(255), @mode int)
AS
BEGIN
	IF(@mode = 1)
	BEGIN
		SELECT * FROM PHIEUDUTHI -- chỗ này select * vì m không nói ra bao nhiêu cột
	END
	IF(@mode = 2)
	BEGIN
		SELECT * FROM PHIEUDUTHI WHERE HOTENTS LIKE '%' + @tents + '%'
	END
END;
GO


--Thống kê số học viên trong khóa học sắp xếp từ mới đến cũ
CREATE PROCEDURE ThongKeHV_KH
AS
BEGIN
	SELECT KH.MAKH, KH.TENKH, COUNT(*) AS SoLuongHV --lấy 2 thuộc tính mã vs tên
	FROM LOP L, DANHSACHLOP DSL, KHOAHOC KH 
	WHERE L.MALOP = DSL.MALOP and KH.MAKH = L.MAKH
	GROUP BY KH.MAKH, KH.TENKH, KH.NGAYBATDAU
	ORDER BY KH.NGAYBATDAU DESC
END;
GO

--Trigger kiểm tra không quá 10 khóa học trong 1 lớp học
CREATE TRIGGER CheckLop_KH ON LOP FOR INSERT
AS	
	IF ((SELECT COUNT(L.MALOP) 
		FROM LOP L INNER JOIN INSERTED I ON L.MAKH = I.MAKH
		GROUP BY L.MAKH) > 10)

BEGIN
	PRINT 'SO LOP TRONG 1 KHOA HOC KHONG THE LON HON 10'
	ROLLBACK TRAN
END;
GO

--Trigger kiểm tra không quá 30 học sinh trong 1 lớp
CREATE TRIGGER Check_SiSoLop ON DANHSACHLOP FOR INSERT
AS	
	IF ((SELECT COUNT(DSL.MAHV) 
		FROM DANHSACHLOP DSL INNER JOIN INSERTED I ON DSL.MALOP = I.MALOP
		GROUP BY DSL.MALOP) > 30)
BEGIN
	PRINT 'SI SO LOP KHONG QUA 30 HOC VIEN'
	ROLLBACK TRAN
END;
GO

create database [TrendSettersDB]
go
USE [TrendSettersDB]
GO
/****** Object:  Table [dbo].[danh_muc]    Script Date: 09/11/2024 9:20:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danh_muc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_danh_muc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__danh_muc__3213E83F4C8FB3FD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__danh_muc__B3D2892532560996] UNIQUE NONCLUSTERED 
(
	[ten_danh_muc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoa_don]    Script Date: 09/11/2024 9:20:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_khach_hang] [int] NULL,
	[ma_nhan_vien] [int] NULL,
	[tong_tien] [decimal](10, 2) NULL,
	[ngay_tao] [datetime] NULL,
	[trang_thai] [nvarchar](50) NULL,
 CONSTRAINT [PK__hoa_don__3213E83FFAA302F7] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoa_don_chi_tiet]    Script Date: 09/11/2024 9:20:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don_chi_tiet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_hoa_don] [int] NULL,
	[ma_san_pham_chi_tiet] [int] NULL,
	[so_luong] [int] NOT NULL,
	[gia] [float] NOT NULL,
 CONSTRAINT [PK__hoa_don___3213E83F66049897] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khach_hang]    Script Date: 09/11/2024 9:20:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khach_hang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ho_ten] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[so_dien_thoai] [nvarchar](15) NOT NULL,
	[dia_chi] [nvarchar](255) NULL,
	[mat_khau] [nvarchar](255) NOT NULL,
	[ngay_tao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kich_thuoc]    Script Date: 09/11/2024 9:20:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kich_thuoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_kich_thuoc] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ten_kich_thuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mau_sac]    Script Date: 09/11/2024 9:20:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mau_sac](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_mau_sac] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ten_mau_sac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhan_vien]    Script Date: 09/11/2024 9:20:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhan_vien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ho_ten] [nvarchar](100) NOT NULL,
	[vai_tro] [nvarchar](50) NULL,
	[tai_khoan] [nvarchar](50) NOT NULL,
	[mat_khau] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[tai_khoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[san_pham]    Script Date: 09/11/2024 9:20:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[san_pham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_san_pham] [nvarchar](100) NOT NULL,
	[ma_danh_muc] [int] NULL,
 CONSTRAINT [PK__san_pham__3213E83FB506AFF2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[san_pham_chi_tiet]    Script Date: 09/11/2024 9:20:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[san_pham_chi_tiet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_san_pham] [int] NULL,
	[ma_mau_sac] [int] NULL,
	[ma_kich_thuoc] [int] NULL,
	[so_luong] [int] NOT NULL,
	[hinh_anh] [varchar](max) NULL,
	[mo_ta] [nvarchar](max) NULL,
	[gia] [float] NOT NULL,
 CONSTRAINT [PK__chi_tiet__3213E83F6339B9D0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[hoa_don] ADD  CONSTRAINT [DF__hoa_don__ngay_ta__3A81B327]  DEFAULT (getdate()) FOR [ngay_tao]
GO
ALTER TABLE [dbo].[hoa_don] ADD  CONSTRAINT [DF__hoa_don__trang_t__3B75D760]  DEFAULT ('dang_xu_ly') FOR [trang_thai]
GO
ALTER TABLE [dbo].[khach_hang] ADD  DEFAULT (getdate()) FOR [ngay_tao]
GO
ALTER TABLE [dbo].[nhan_vien] ADD  DEFAULT ('nhan_vien') FOR [vai_tro]
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD  CONSTRAINT [FK__hoa_don__ma_khac__440B1D61] FOREIGN KEY([ma_khach_hang])
REFERENCES [dbo].[khach_hang] ([id])
GO
ALTER TABLE [dbo].[hoa_don] CHECK CONSTRAINT [FK__hoa_don__ma_khac__440B1D61]
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD  CONSTRAINT [FK_hoa_don_nhan_vien] FOREIGN KEY([ma_nhan_vien])
REFERENCES [dbo].[nhan_vien] ([id])
GO
ALTER TABLE [dbo].[hoa_don] CHECK CONSTRAINT [FK_hoa_don_nhan_vien]
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet]  WITH CHECK ADD  CONSTRAINT [FK_hoa_don_chi_tiet_chi_tiet_san_pham] FOREIGN KEY([ma_san_pham_chi_tiet])
REFERENCES [dbo].[san_pham_chi_tiet] ([id])
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet] CHECK CONSTRAINT [FK_hoa_don_chi_tiet_chi_tiet_san_pham]
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet]  WITH CHECK ADD  CONSTRAINT [FK_hoa_don_chi_tiet_hoa_don] FOREIGN KEY([ma_hoa_don])
REFERENCES [dbo].[hoa_don] ([id])
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet] CHECK CONSTRAINT [FK_hoa_don_chi_tiet_hoa_don]
GO
ALTER TABLE [dbo].[san_pham]  WITH CHECK ADD  CONSTRAINT [FK_san_pham_danh_muc] FOREIGN KEY([ma_danh_muc])
REFERENCES [dbo].[danh_muc] ([id])
GO
ALTER TABLE [dbo].[san_pham] CHECK CONSTRAINT [FK_san_pham_danh_muc]
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD  CONSTRAINT [FK_san_pham_chi_tiet_kich_thuoc] FOREIGN KEY([ma_kich_thuoc])
REFERENCES [dbo].[kich_thuoc] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet] CHECK CONSTRAINT [FK_san_pham_chi_tiet_kich_thuoc]
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD  CONSTRAINT [FK_san_pham_chi_tiet_mau_sac] FOREIGN KEY([ma_mau_sac])
REFERENCES [dbo].[mau_sac] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet] CHECK CONSTRAINT [FK_san_pham_chi_tiet_mau_sac]
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD  CONSTRAINT [FK_san_pham_chi_tiet_san_pham] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[san_pham] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet] CHECK CONSTRAINT [FK_san_pham_chi_tiet_san_pham]
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD  CONSTRAINT [CK__hoa_don__tong_ti__49C3F6B7] CHECK  (([tong_tien]>=(0)))
GO
ALTER TABLE [dbo].[hoa_don] CHECK CONSTRAINT [CK__hoa_don__tong_ti__49C3F6B7]
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD  CONSTRAINT [CK__hoa_don__tong_ti__59063A47] CHECK  (([tong_tien]>=(0)))
GO
ALTER TABLE [dbo].[hoa_don] CHECK CONSTRAINT [CK__hoa_don__tong_ti__59063A47]
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet]  WITH CHECK ADD  CONSTRAINT [CK__hoa_don_chi_tiet__so_luong] CHECK  (([so_luong]>(0)))
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet] CHECK CONSTRAINT [CK__hoa_don_chi_tiet__so_luong]
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet]  WITH CHECK ADD  CONSTRAINT [CK_hoa_don_chi_tiet_gia] CHECK  (([gia]>(0)))
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet] CHECK CONSTRAINT [CK_hoa_don_chi_tiet_gia]
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD  CONSTRAINT [CK__chi_tiet___so_lu__48CFD27E] CHECK  (([so_luong]>=(0)))
GO
ALTER TABLE [dbo].[san_pham_chi_tiet] CHECK CONSTRAINT [CK__chi_tiet___so_lu__48CFD27E]
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD  CONSTRAINT [CK__chi_tiet_sa__gia__49C3F6B7] CHECK  (([gia]>(0)))
GO
ALTER TABLE [dbo].[san_pham_chi_tiet] CHECK CONSTRAINT [CK__chi_tiet_sa__gia__49C3F6B7]
GO

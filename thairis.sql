-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2017 at 03:21 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ris`
--

-- --------------------------------------------------------

--
-- Table structure for table `thairis_mail`
--

CREATE TABLE `thairis_mail` (
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `messages` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE `version` (
  `VERSION` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `version`
--

INSERT INTO `version` (`VERSION`) VALUES
('1.1');

-- --------------------------------------------------------

--
-- Table structure for table `xray_amphoe`
--

CREATE TABLE `xray_amphoe` (
  `AMPHOE_CODE` varchar(20) NOT NULL,
  `AMPHOE_NAME` varchar(50) NOT NULL,
  `AMPHOE_NAME_ENG` varchar(50) DEFAULT NULL,
  `PROVINCE_CODE` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_auto`
--

CREATE TABLE `xray_auto` (
  `ID` int(11) NOT NULL,
  `LAST_REQUEST_NO` varchar(10) NOT NULL,
  `YEAR` year(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_auto`
--

INSERT INTO `xray_auto` (`ID`, `LAST_REQUEST_NO`, `YEAR`) VALUES
(1, '7', 2017);

-- --------------------------------------------------------

--
-- Table structure for table `xray_billing`
--

CREATE TABLE `xray_billing` (
  `ID` int(11) NOT NULL,
  `XRAY_BILL_NO` varchar(10) NOT NULL,
  `REQUEST_NO` varchar(10) NOT NULL,
  `XRAY_CODE` varchar(10) NOT NULL,
  `XRAY_PRICE` int(10) UNSIGNED NOT NULL,
  `DF` int(10) UNSIGNED DEFAULT NULL,
  `CHARGED` int(1) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_birad`
--

CREATE TABLE `xray_birad` (
  `ID` int(2) NOT NULL,
  `BIRAD` varchar(10) NOT NULL,
  `LEVEL` varchar(1) NOT NULL,
  `DESCRIPTION` varchar(60) NOT NULL,
  `DETAIL` varchar(200) NOT NULL,
  `DETAIL_THAI` varchar(200) NOT NULL,
  `FOLLOW_UP` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_birad`
--

INSERT INTO `xray_birad` (`ID`, `BIRAD`, `LEVEL`, `DESCRIPTION`, `DETAIL`, `DETAIL_THAI`, `FOLLOW_UP`) VALUES
(1, 'BI-RADS 0', '0', 'BI-RADS 0 : Incomplete assessment ', 'Your mammogram or ultrasound didn''t give the radiologist enough information to make a clear diagnosis; follow-up imaging is necessary', '', ''),
(2, 'BI-RADS 1', '1', 'BI-RADS 1 : Negative finding(s) (within normal) ', 'There is nothing to comment on; routine screening recommended', '', ''),
(3, 'BI-RADS 2', '2', 'BI-RADS 2 : Benign finding(s)', 'A definite benign finding; routine screening recommended', '', ''),
(4, 'BI-RADS 3', '3', 'BI-RADS 3 : Probably benign finding(s), 12-months follow-up', 'Findings that have a high probability of being benign (>98%); 12-month short interval follow-up', '', ''),
(5, 'BI-RADS 4', '4', 'BI-RADS 4 : Suspicious abnormality, biopsy recommend ', 'Not characteristic of breast cancer, but reasonable probability of being malignant (3 to 94%); biopsy should be considered', '', ''),
(6, 'BI-RADS 5', '5', 'BI-RADS 5 : Highly suggestive of malignancy ', 'Lesion that has a high probability of being malignant (>= 95%); take appropriate action', '', ''),
(7, 'BI-RADS 6', '6', 'BI-RADS 6 : Known Biopsy Proven Malignancy', 'Lesions known to be malignant that are being imaged ', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `xray_body_part`
--

CREATE TABLE `xray_body_part` (
  `ID` varchar(3) NOT NULL,
  `BODY_PART` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_body_part`
--

INSERT INTO `xray_body_part` (`ID`, `BODY_PART`) VALUES
('', 'ABDOMEN'),
('', 'CHEST'),
('', 'HEAD'),
('', 'LOWER EXTREMITY'),
('', 'MAMMO'),
('', 'NECK'),
('', 'OTHER'),
('', 'PELVIS'),
('', 'SHOULDER'),
('', 'SPINE'),
('', 'UPPER EXTREMITY');

-- --------------------------------------------------------

--
-- Table structure for table `xray_center`
--

CREATE TABLE `xray_center` (
  `CODE` varchar(20) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `NAME_ENG` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_center`
--

INSERT INTO `xray_center` (`CODE`, `NAME`, `NAME_ENG`) VALUES
('THAIRIS', 'Thai RIS', 'Thai Radio');

-- --------------------------------------------------------

--
-- Table structure for table `xray_code`
--

CREATE TABLE `xray_code` (
  `CENTER` varchar(10) NOT NULL,
  `XRAY_CODE` varchar(20) NOT NULL,
  `DESCRIPTION` varchar(50) NOT NULL,
  `XRAY_TYPE_CODE` varchar(50) NOT NULL,
  `BODY_PART` varchar(15) NOT NULL,
  `CHARGE_TOTAL` float UNSIGNED NOT NULL,
  `PORTABLE_CHARGE` int(4) NOT NULL,
  `DF` int(5) UNSIGNED DEFAULT NULL,
  `TIME_USE` int(3) UNSIGNED DEFAULT NULL,
  `BIRAD_FLAG` varchar(1) NOT NULL DEFAULT '0',
  `PREP_ID` varchar(10) NOT NULL,
  `DELETE_FLAG` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_code`
--

INSERT INTO `xray_code` (`CENTER`, `XRAY_CODE`, `DESCRIPTION`, `XRAY_TYPE_CODE`, `BODY_PART`, `CHARGE_TOTAL`, `PORTABLE_CHARGE`, `DF`, `TIME_USE`, `BIRAD_FLAG`, `PREP_ID`, `DELETE_FLAG`) VALUES
('THAIRIS', 'B0101', 'CHEST (PA UPRIGHT)', 'XRAY', 'CHEST', 500, 20, 300, 10, '0', '', 0),
('THAIRIS', 'B0102', 'CHEST', 'XRAY', 'CHEST', 2004, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0103', 'CHEST-RT(LAT)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0104', 'CHEST-LT(LAT)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0105', 'CHEST-RT(LAT DECUBITUS)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0106', 'CHEST-LT(LAT DECUBITUS)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0107', 'CHEST(LORDOTICOR APICOGRAM)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0108', 'CHEST-RT(AP OBLIQUE)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0109', 'CHEST-LT(AP OBLIQUE)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0110', 'CHEST-RT(PA OBLIQUE)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0111', 'CHEST-LT(PA OBLIQUE)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0112', 'CHEST(SPOT RUL)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0113', 'CHEST(SPOT LUL)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0114', 'CHEST(SPOT RML)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0115', 'CHEST(SPOT LML)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0116', 'CHEST(SPOT RLL)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0117', 'CHEST(SPOT LLL)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0118', 'CHEST(PA,RT LAT)', 'XRAY', 'CHEST', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B0119', 'CHEST(PA,LT LAT)', 'XRAY', 'CHEST', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B0120', 'CHEST(INCLUDE ABDOMEN)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0201', 'RIB(AP OR PA)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0202', 'RIB-RT(OBLIQUE)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0203', 'RIB-LT(OBLIQUE)', 'XRAY', 'CHEST', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0204', 'RIB-BOTH(OBLIQUE)', 'XRAY', 'CHEST', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B0205', 'RIB-RT(PA, OBLIQUE)', 'XRAY', 'CHEST', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B0206', 'RIB-LT(PA, OBLIQUE)', 'XRAY', 'CHEST', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B0207', 'RIB(PA FOR CHEST, BOTH OBLIQUE) ', 'XRAY', 'CHEST', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B0208', 'RIB RT(PA  FOR CHEST, OBLIQUE) ', 'XRAY', 'CHEST', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B0209', 'RIB LT(PA FOR CHEST, OBLIQUE) ', 'XRAY', 'CHEST', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B0301', 'CLAVICLE-RT', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0302', 'CLAVICLE-LT', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0303', 'CLAVICLE-BOTH', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0304', 'CLAVICLE-BOTH WEIGHT', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0401', 'STERNUM(LAT)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0402', 'STERUM(OBLIQUE)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0403', 'STRENUM(LAT, OBLIQUE)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B0501', 'ACROMIO-CLAVICULAR JOINT-RT(AP)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0502', 'ACROMIO-CLAVICULAR JOINT-LT(AP)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0503', 'ACROMIO-CLAVICULAR JOINT-BOTH(AP)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0601', 'STERNO-CLAVICULAR JOINT-RT(PA)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0602', 'STERNO-CLAVICULAR JOINT-LT(PA)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0603', 'STERNO-CLAVICULAR JOINT-BOTH(PA)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0701', 'SCAPULAR-RT(AP)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0702', 'SCAPULAR-LT(AP)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0703', 'SCAPULAR-RT(LAT)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0704', 'SCAPULAR-LT(LAT)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0705', 'SCAPULAR-RT(AP, LAT)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B0706', 'SCAPULAR-LT(AP, LAT)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B0707', 'SCAPULAR-BOTH(AP, LAT)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B0801', 'ABDOMEN(UPRIGHT)', 'XRAY', 'ABDOMEN', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0802', 'ABDOMEN(SUPINE)', 'XRAY', 'ABDOMEN', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0803', 'ABDOMEN(LAT)', 'XRAY', 'ABDOMEN', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0804', 'ABDOMEN(SUPINE, UPRIGHT)', 'XRAY', 'ABDOMEN', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B0805', 'ACUTE ABDOMEN SERIES(CHEST,ABDOMEN)', 'XRAY', 'ABDOMEN', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B0806', 'ABDOMEN-RT(LAT DECUBITUS)', 'XRAY', 'ABDOMEN', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0807', 'ABDOMEN-LT(LAT DECUBITUS)', 'XRAY', 'ABDOMEN', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0808', 'ABDOMEN-RT(DORSAL  DECUBITUS)', 'XRAY', 'ABDOMEN', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0809', 'ABDOMEN-LT(DORSAL  DECUBITUS)', 'XRAY', 'ABDOMEN', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0810', 'ABDOMEN-(LAT CROSSTABLE)', 'XRAY', 'ABDOMEN', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0901', 'PLAIN KUB(AP)', 'XRAY', 'ABDOMEN', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B0902', 'KUB AND LAT LS SPINE', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B1001', 'PELVIS(AP)', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B1002', 'PELVIS(FROG LEG)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B1003', 'PELVIS(AP,FROG LEG)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B1004', 'PELVIS(JUDET''S VIEW)', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B1005', 'PELVIS(AP, JUDET''S VIEW)', 'XRAY', 'PELVIS', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B1006', 'PELVIS(INLET,OUTLET VIEW)', 'XRAY', 'PELVIS', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'B1007', 'PELVIS RT OBLIQUE', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B1008', 'PELVIS LT OBLIQUE', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'B1009', 'PELVIS AP Long Film', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'BD101', 'BONE DENSITY-FORARM-RT', 'BMD', 'UPPER EXTREMITY', 2000, 0, 500, 20, '0', '', 0),
('THAIRIS', 'BD102', 'BONE DENSITY- FORARM-LT', 'BMD', 'UPPER EXTREMITY', 2000, 0, 500, 20, '0', '', 0),
('THAIRIS', 'BD103', 'BONE DENSITY-HIP-RT', 'BMD', 'PELVIS', 2000, 0, 500, 20, '0', '', 0),
('THAIRIS', 'BD104', 'BONE DENSITY-HIP-LT', 'BMD', 'PELVIS', 2000, 0, 500, 20, '0', '', 0),
('THAIRIS', 'BD105', 'BONE DENSITY-HIP-BOTH', 'BMD', 'PELVIS', 2000, 0, 500, 20, '0', '', 0),
('THAIRIS', 'BD106', 'BONE DENSITY-LUMBAR SPINE-AP', 'BMD', 'SPINE', 2000, 0, 500, 20, '0', '', 0),
('THAIRIS', 'BD107', 'BONE DENSITY-LUMBRA SPINE-LAT', 'BMD', 'SPINE', 2000, 0, 500, 20, '0', '', 0),
('THAIRIS', 'BD108', 'BONE DENSITY-LUMBAR SPINE-HIP', 'BMD', 'PELVIS', 2000, 0, 500, 20, '0', '', 0),
('THAIRIS', 'BD109', 'BONE DENSITY-LUMBAR SPINE AND HIP-BOTH', 'BMD', 'PELVIS', 2000, 0, 500, 20, '0', '', 0),
('THAIRIS', 'BD110', 'BONE DENSITY-TOTAL BODY', 'BMD', '', 2000, 0, 500, 20, '0', '', 0),
('THAIRIS', 'BD111', 'BONE DENSITY-WRIST  BY US', 'BMD', 'UPPER EXTREMITY', 2000, 0, 500, 20, '0', '', 0),
('THAIRIS', 'BD112', 'BONE DENSITY-ANKLE', 'BMD', 'LOWER EXTREMITY', 2000, 0, 500, 20, '0', '', 0),
('THAIRIS', 'C0101', 'CT BRAIN NON CONTRAST MEDIA', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0102', 'CT BRAIN WITH CONTRAST MEDIA', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0103', 'CT BRAIN FOR STEREOTASY', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0104', 'CT BRAIN FOR NAVIGATOR', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0105', 'CT BRAIN PERFUSION (ONLY)', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0106', 'CT STROKE PACKAGE', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0107', 'CT PITUITARY', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0108', 'CT BRAIN+BASE OF SKULL', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0109', 'CT BRAIN+FACIAL BONE', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0110', 'CT BRAIN+ORBIT', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0111', 'CT BRAIN+SINUS', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0201', 'CT TEMPORAL BONE', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0202', 'CT PARANASAL SINUSES', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0203', 'CT PARANASAL SINUSES FOR NAVIGATOR', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0204', 'CT FACIAL BONE', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0205', 'CT ORBIT', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0206', 'CT NASOPHARYNX', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0207', 'CT NECK OR THYROID OR PARATHYROID', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0208', 'CT NECK FOR NODAL STAGING', 'CT', 'NECK', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0209', 'CT LARYNX', 'CT', 'NECK', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0210', 'CT ORAL CAVITY', 'CT', 'NECK', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0211', 'CT OROPHARYNX', 'CT', 'NECK', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0212', 'CT HEAD AND NECK(TUMOR+NODAL STAGING)', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0301', 'CT DENTAL MAXILLA', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0302', 'CT DENTAL MANDIBLE', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0401', 'CT CERVICAL  SPINE ', 'CT', 'SPINE', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0402', 'CT CERVICAL  SPINE AND DYNAMIC', 'CT', 'SPINE', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0403', 'CT THORACIC SPINE', 'CT', 'SPINE', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0404', 'CT THORACOLUMBAR SPINE', 'CT', 'SPINE', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0405', 'CT LUMBROSACRAL SPINE', 'CT', 'SPINE', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'C0406', 'CT WHOLE SPINE', 'CT', 'SPINE', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'C0407', 'CT SACRUM AND COCCYX', 'CT', 'SPINE', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'C0501', 'CT CHEST NON CONTRAST MEDIA', 'CT', 'CHEST', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'C0502', 'CT CHEST WITH CONTRAST MEDIA', 'CT', 'CHEST', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'C0503', 'CT CHEST FOR PULMONARY EMBOLIZATION', 'CT', 'CHEST', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'C0504', 'CT HRCT', 'CT', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'C0505', 'CT LUNG FUNCTIONAL', 'CT', 'CHEST', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'C0601', 'CT CORONARY ARTERY CALCIFICATION', 'CT', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'C0602', 'CTA CORONARY(ROUTINE)', 'CT', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'C0603', 'CTA CORONARY TRIPLE R/O', 'CT', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'C0604', 'CTA CORONARY GRAFT EVALUATION', 'CT', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'C0701', 'CT UPPER ABDOMEN', 'CT', 'ABDOMEN', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0702', 'CT LOWER ABDOMEN', 'CT', 'ABDOMEN', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0703', 'CT WHOLE ABDOMEN', 'CT', 'ABDOMEN', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0704', 'CT LIVER', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0705', 'CT PANCREAS', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0706', 'CT KIDNEY', 'CT', 'ABDOMEN', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0707', 'CT PROSTATE', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0708', 'CT COLONOSCOPY', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0709', 'CT PERFUSION OF ABDOMINAL ORGAN (ONLY)', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0801', 'CT SHOULDER', 'CT', 'SHOULDER', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0802', 'CT HUMERUS', 'CT', 'UPPER EXTREMITY', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0803', 'CT ELBOW', 'CT', 'UPPER EXTREMITY', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0804', 'CT FOREARM', 'CT', 'UPPER EXTREMITY', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0805', 'CT WRIST', 'CT', 'UPPER EXTREMITY', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0806', 'CT HAND', 'CT', 'UPPER EXTREMITY', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0807', 'CT HIP', 'CT', 'PELVIS', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0808', 'CT FEMUR OR THIGH', 'CT', 'LOWER EXTREMITY', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0809', 'CT KNEE', 'CT', 'LOWER EXTREMITY', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0810', 'CT LEG', 'CT', 'LOWER EXTREMITY', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0811', 'CT ANKLE', 'CT', 'LOWER EXTREMITY', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0812', 'CT FOOT', 'CT', 'LOWER EXTREMITY', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C0901', 'CTA BRAIN ( CIRCLE OF WILLIS ONLY)', 'CT', 'HEAD', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C0902', 'CTA AND CT BRAIN', 'CT', 'HEAD', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C0903', 'CTA NECK (ONLY)', 'CT', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C0904', 'CTA AND CT NECK  ', 'CT', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C0905', 'CTA BRAIN AND NECK (ONLY)', 'CT', 'HEAD', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C0906', 'CTA AND CT BRAIN AND NECK ', 'CT', 'HEAD', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C1001', 'CTA PULMONARY SYSTEM', 'CT', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C1101', 'CTA THORACIC AORTA (ONLY)', 'CT', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C1102', 'CTA ABDOMINAL AORTA (ONLY)', 'CT', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C1103', 'CTA WHOLE AORTA (ONLY)', 'CT', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C1201', 'CTA RENAL ARTERY (ONLY)', 'CT', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C1202', 'CTA PORTAL  SYSTEM (ONLY)', 'CT', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C1203', 'CTA LIVER DONOR (ONLY)', 'CT', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C1204', 'CTA LIVER (ONLY)', 'CT', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C1205', 'CTA CAELIAC /SMA /IMA (ONLY)', 'CT', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C1301', 'CTA RENAL DIALYSIS SHUNT EVALUATION (ONLY)', 'CT', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C1302', 'CTA HUMERUS (ONLY)', 'CT', 'UPPER EXTREMITY', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C1303', 'CTA PERIPHERAL  RUN OFF (ONLY)', 'CT', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'C1401', 'CT-SCREENING LUNG CANCER(LOW DOSE)', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C1402', 'CT-SCREENING ACUTE ABDOMEN ', 'CT', 'ABDOMEN', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C1403', 'CT-SCREENING LIVER CANCER', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C1404', 'CT-SCREENING KUB STONE', 'CT', 'ABDOMEN', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C1405', 'CT-SCREENING PARANASAL SINUSES', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C1501', 'CT TOTAL BODY TRAUMA', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C1502', 'CT BRAIN TRAUMA', 'CT', 'HEAD', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C1503', 'CT CERVICAL SPINES TRAUMA', 'CT', 'SPINE', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C1504', 'CT THORACIC SPINE TRAUMA', 'CT', 'SPINE', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C1505', 'CT THORACOLUMBAR SPINE TRAUMA', 'CT', 'SPINE', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C1506', 'CT LUMBROSACRAL SPINE TRAUMA', 'CT', 'SPINE', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C1507', 'CT SACRUM TRAUMA', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C1508', 'CT WHOLE SPINE TRAUMA', 'CT', 'SPINE', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C1509', 'CT THORAX TRAUMA', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C1510', 'CT ABDOMINAL TRAUMA', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C1511', 'CT UPPER EXTREMITY TRAUMA', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'C1512', 'CT LOWER EXTREMITY TRAUMA', 'CT', '', 5000, 0, 1000, 15, '0', '', 0),
('THAIRIS', 'E0101', 'SHOULDER-RT(AP)', 'XRAY', 'SHOULDER', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0102', 'SHOULDER-LT(AP)', 'XRAY', 'SHOULDER', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0103', 'SHOULDER-BOTH(AP)', 'XRAY', 'SHOULDER', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0104', 'SHOULDER-RT( INT, EXT ROTATION)', 'XRAY', 'SHOULDER', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0105', 'SHOULDER-LT( INT, EXT ROTATION)', 'XRAY', 'SHOULDER', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0106', 'SHOULDER-RT(TRANSAXILLA)', 'XRAY', 'SHOULDER', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0107', 'SHOULDER-LT(TRANSAXILLA)', 'XRAY', 'SHOULDER', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0108', 'SHOULDER-RT(TRANSCAPULAR)', 'XRAY', 'SHOULDER', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0109', 'SHOULDER-LT(TRANSCAPULAR)', 'XRAY', 'SHOULDER', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0110', 'SHOULDER-RT(AP, TRANSAXILLA)', 'XRAY', 'SHOULDER', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0111', 'SHOULDER-LT(AP, TRANSAXILLA)', 'XRAY', 'SHOULDER', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0112', 'SHOULDER-RT(AP, TRANSCAPULAR)', 'XRAY', 'SHOULDER', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0113', 'SHOULDER-LT(AP, TRANSCAPULAR)', 'XRAY', 'SHOULDER', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0114', 'SHOULDER-RT(AP,TRANSAXILLA,TRANSCAPULAR)', 'XRAY', 'SHOULDER', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0115', 'SHOULDER-LT(AP,TRANSAXILLA,TRANSCAPULAR)', 'XRAY', 'SHOULDER', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0116', 'SHOULDER-RT(AP CAUDAL 30 DEGREE)', 'XRAY', 'SHOULDER', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0117', 'SHOULDER-LT(AP CAUDAL 30 DEGREE)', 'XRAY', 'SHOULDER', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0118', 'SHOULDER-RT(INF.-SUP. AXIAL WEST POINT)', 'XRAY', 'SHOULDER', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0119', 'SHOULDER-LT(INF.-SUP. AXIAL WEST POINT)', 'XRAY', 'SHOULDER', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0120', 'SHOULDER-RT(SUPRASPINATOUS OUTLET VIEW)', 'XRAY', 'SHOULDER', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0121', 'SHOULDER-LT(SUPRASPINATOUS OUTLET VIEW)', 'XRAY', 'SHOULDER', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0122', 'SHOULDER-RT(TRANTHORACIC  VIEW)', 'XRAY', 'SHOULDER', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0123', 'SHOULDER-LT(TRANTHORACIC  VIEW)', 'XRAY', 'SHOULDER', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0124', 'SHOULDER-RT(AP, TRANTHORACIC  VIEW)', 'XRAY', 'SHOULDER', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0125', 'SHOULDER-LT(AP, TRANTHORACIC  VIEW)', 'XRAY', 'SHOULDER', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0126', 'SHOULDER-RT(GLENOID CAVITY OBLIQUE)', 'XRAY', 'SHOULDER', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0127', 'SHOULDER-LT(GLENOID CAVITY OBLIQUE)', 'XRAY', 'SHOULDER', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0201', 'HUMERUS-RT(AP)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0202', 'HUMERUS-LT(AP)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0203', 'HUMERUS-RT(LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0204', 'HUMERUS-LT(LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0205', 'HUMERUS-RT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0206', 'HUMERUS-LT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0301', 'FOREARM-RT(AP)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0302', 'FOREARM-LT(AP)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0303', 'FOREARM-RT(LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0304', 'FOREARM-LT(LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0305', 'FOREARM-RT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0306', 'FOREARM-LT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0307', 'FOREARM-BOTH(AP)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0308', 'FOREARM INCLUDE ELBOW-RT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0309', 'FOREARM INCLUDE ELBOW-LT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0401', 'ELBOW-RT(AP)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0402', 'ELBOW-LT(AP)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0403', 'ELBOW-RT(LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0404', 'ELBOW-LT(LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0405', 'ELBOW-RT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0406', 'ELBOW-LT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0407', 'ELBOW-RT(OBLIQUE INT,EXT ROTATION)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0408', 'ELBOW-LT(OBLIQUE INT,EXT ROTATION)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0501', 'WRIST-RT(AP)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0502', 'WRIST-LT(AP)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0503', 'WRIST-BOTH(AP)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0504', 'WRIST-RT(LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0505', 'WRIST-LT(LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0506', 'WRIST-BOTH(LAT)(H) ', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0507', 'WRIST-RT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0508', 'WRIST-LT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0509', 'WRIST-LT(AP, LAT,ULNAR DEVIATION)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0510', 'WRIST-RT(AP, LAT,ULNAR DEVIATION)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0511', 'CARPAL SERIES-RT(AP, LAT, BOTH OBLIQUE)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0512', 'CARPAL SERIES-LT(AP, LAT, BOTH OBLIQUE)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0513', 'CARPAL TUNNEL-RT(TANGENTIAL)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0514', 'CARPAL TUNNEL-LT(TANGENTIAL)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0515', 'CARPAL BRIDGE-RT(TANGENTIAL)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0516', 'CARPAL BRIDGE-LT(TANGENTIAL)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0601', 'HAND-RT(AP)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0602', 'HAND-LT(AP)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0603', 'HAND-BOTH(AP)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0604', 'HAND-RT(LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0605', 'HAND-LT(LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0606', 'HAND-RT(AP,OBLIQUE)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0607', 'HAND-LT(AP,OBLIQUE)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0608', 'HAND-RT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'E0609', 'HAND-LT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0610', 'HAND-BOTH(AP OBLIQUE BILAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0701', 'THUMB FINGER-RT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0702', 'THUMB FINGER-LT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0801', 'INDEX FINGER-RT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0802', 'INDEX FINGER-LT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0901', 'MIDDLE FINGER-RT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E0902', 'MIDDLE FINGER-LT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E1001', 'RING FINGER-RT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E1002', 'RING FINGER-LT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E1101', 'LITTLE FINGER-RT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'E1102', 'LITTLE FINGER-LT(AP, LAT)', 'XRAY', 'UPPER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0101 ', 'SKULL(AP OR PA)', 'XRAY', 'HEAD', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H0102', 'SKULL(LAT)', 'XRAY', 'HEAD', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H0103', 'SKULL(TOWNE''S)', 'XRAY', 'HEAD', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H0104', 'SKULL(WATER''S)', 'XRAY', 'HEAD', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H0105', 'SKULL CALDWELL', 'XRAY', 'HEAD', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H0106', 'SKULL(AP OR PA, LAT)', 'XRAY', 'HEAD', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0107', 'SKULL SERIES(AP OR PA, LAT, TOWNE''S)', 'XRAY', 'HEAD', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0108', 'FACIAL BONE(APOR PA,LAT,TOWNE''S,WATER''S)', 'XRAY', 'HEAD', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0109', 'SKULL (SUBMENTOVERTEX OR BASE OF SKULL)', 'XRAY', 'HEAD', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H0110', 'SKULL (AP SUPINE & UPRIGHT)', 'XRAY', 'HEAD', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0111', 'SKULL (LAT  SUPINE & UPRIGHT)', 'XRAY', 'HEAD', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0112', 'SKULL(WATER''S, TOWNE''S)', 'XRAY', 'HEAD', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0113', 'SKULL(AP OR PA, LAT,WATER''S)', 'XRAY', 'HEAD', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0114', 'SKULL(SUBMENTOVERTEX, LAT)', 'XRAY', 'HEAD', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0201', 'PARANASAL SINUSES(CALDWELL, WATER''S)', 'XRAY', 'HEAD', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0202', 'PARANASAL SINUSES(LAT)', 'XRAY', 'HEAD', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H0301', 'ORBITS(CALDWELL)', 'XRAY', 'HEAD', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H0302', 'ORBITS(SEMI WATER''S)', 'XRAY', 'HEAD', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H0303', 'ORBITS(LAT)', 'XRAY', 'HEAD', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H0304', 'ORBITS(CALDWELL, SEMIWATER''S)', 'XRAY', 'HEAD', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H0305', 'ORBITS FOR FOREIGN BODY', 'XRAY', 'HEAD', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H0306', 'OPTIC  FORAMINA(RHESE''S )', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H0401', 'IAC(PA, STENVER''S, TOWNE''S)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0501', 'SELLA TURCICA(TOWNE''S, LAT)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0601', 'MASTOID AIR CELLS(LAT, TOWNE''S)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0602', 'MASTOID AIR CELLS(OBLIQUE)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0701', 'T-M JOINT(OBLIQUE OPEN&CLOSE MOUTH)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0702', 'T-M JOINT(TOWNE''S)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H0801', 'STYLOID PROCESS(PA, LAT)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0901', 'NASAL BONE(WATER''S)', 'XRAY', 'HEAD', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H0902', 'NASAL BONE(LAT)', 'XRAY', 'HEAD', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H0903', 'NASAL BONE(WATER''S , LAT)', 'XRAY', 'HEAD', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H1001', 'MAXILAR(SEMI-WATER''S)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H1002', 'MAXILAR(PA)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H1003', 'MAXILAR(PA, SEMI-WATER''S)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H1101', 'MANDIBLE(PA)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H1102', 'MANDIBLE(TOWNE''S)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H1103', 'MANDIBLE(OBLIQUE)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H1104', 'MANDIBLE-RT(PA, OBLIQUE)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H1105', 'MANDIBLE-LT(PA, OBLIQUE)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H1106', 'MANDIBLE(PA, BOTH OBLIQUE, TOWNE''S)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H1201', 'ZYGOMATIC(SUBMENTOVERTEX)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H1202', 'ZYGOMATIC(TOWNE''S)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H1203', 'ZYGOMATIC(OBLIQUE TANGENTIAL)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H1204', 'ZYGOMATIC(SUBMENTOVERTEX, TOWNE''S)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H1301', 'NASOPHARYNX(LAT, SUBMENTOVERTEX)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H1401', 'ADENOID(LAT)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H1501', 'NECK(AP)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H1502', 'NECK(LAT)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'H1503', 'NECK(AP, LAT)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'H1504', 'NECK(LAT SOFT TISSUE)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0101', 'HIP-RT(AP)', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0102', 'HIP-LT(AP)', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0103', 'HIP-BOTH(AP)', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0104', 'HIP-RT(LAT)', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0105', 'HIP-LT(LAT)', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0106', 'HIP-BOTH(LAT)', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0107', 'HIP-RT(AP, LAT)', 'XRAY', 'PELVIS', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0108', 'HIP-LT(AP, LAT)', 'XRAY', 'PELVIS', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0109', 'HIP-RT(LAT CROSSTABLE)', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0110', 'HIP-LT(LAT CROSSTABLE)', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0111', 'HIP-RT(AP,LAT CROSSTABLE)', 'XRAY', 'PELVIS', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0112', 'HIP-LT(AP,LAT CROSSTABLE)', 'XRAY', 'PELVIS', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0113', 'HIP-BOTH(AP,LAT CROSSTABLE)', 'XRAY', 'PELVIS', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0114', 'HIP-RT(FROG LEG)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0115', 'HIP-LT(FROG LEG)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0116', 'HIP-BOTH(FROG LEG)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0117', 'HIP-RT(AP, FROG LEG)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0118', 'HIP-LT(AP, FROG LEG)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0119', 'HIP-BOTH(AP, FROG LEG)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0120', 'HIP BOTH(AP, JUDET''S VIEW)', 'XRAY', 'PELVIS', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0121', 'HIP RT(AP, JUDET''S VIEW)', 'XRAY', 'PELVIS', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0122', 'HIP LT(AP, JUDET''S VIEW)', 'XRAY', 'PELVIS', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0123', 'HIP RT(JUDET''S VIEW)', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0124', 'HIP LT(JUDET''S VIEW)', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0125', 'HIP BOTH(LAUENSTIEN VIEW)', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0126', 'HIP RT(LAUENSTIEN VIEW)', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0127', 'HIP LT(LAUENSTIEN VIEW)', 'XRAY', 'PELVIS', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0128', 'HIP RT(AP,LAUENSTIEN VIEW)', 'XRAY', 'PELVIS', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0129', 'HIP LT(AP,LAUENSTIEN VIEW)', 'XRAY', 'PELVIS', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0130', 'HIP INCLUDE FEMUR -RT(AP,LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0131', 'HIP INCLUDE FEMUR -LT(AP,LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0201', 'FEMUR-RT(AP)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0202', 'FEMUR-LT(AP)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0203', 'FEMUR-BOTH(AP)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0204', 'FEMUR-RT(LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0205', 'FEMUR-LT(LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0206', 'FEMUR-BOTH(LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0207', 'FEMUR-RT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0208', 'FEMUR-LT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0209', 'FEMUR INCLUDE KNEE -RT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0210', 'FEMUR INCLUDE KNEE -LT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0301', 'KNEE-RT(AP)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0302', 'KNEE-LT(AP)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0303', 'KNEE-BOTH(AP)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0304', 'KNEE-BOTH(AP STANDING)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0305', 'KNEE-RT(LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0306', 'KNEE-LT(LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0307', 'KNEE-BOTH(LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0308', 'KNEE-RT(LAT STANDING)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0309', 'KNEE-LT(LAT STANDING)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0310', 'KNEE-BOTH(LAT STANDING)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0311', 'KNEE-RT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0312', 'KNEE-LT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0313', 'KNEE-RT(AP, LAT STANDING)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0314', 'KNEE-LT(AP, LAT STANDING)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0315', 'KNEE-BOTH(AP, LAT STANDING)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0316', 'KNEE-RT(MERCHANT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0317', 'KNEE-LT(MERCHANT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0318', 'KNEE-RT(LAURIN)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0319', 'KNEE-LT(LAURIN)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0320', 'KNEE-RT(HUGHSTON)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0321', 'KNEE-LT(HUGHSTON)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0322', 'KNEE(ORTHROSCANOGRAM)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0323', 'KNEE BOTH(AP STANDING,LAT FLEX 45 )', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0324', 'KNEE BOTH(AP ,LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0325', 'KNEE RT(AP STANDING)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0326', 'KNEE LT(AP STANDING)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0327', 'KNEE RT(AP,LAT,SKYLINE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0328', 'KNEE LT(AP,LAT,SKYLINE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0329', 'KNEE BOTH(AP,LAT,SKYLINE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0330', 'KNEE-RT(LAT FLEX45)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0331', 'KNEE-LT(LAT FLEX45)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0401', 'PATELLA-RT(SKYLINE OR SUN RISE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0402', 'PATELLA-LT(SKYLINE OR SUN RISE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0403', 'PATELLA-RT(AP, LAT, SKYLINE OR SUN RISE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0404', 'PATELLA-LT(AP, LAT, SKYLINE OR SUN RISE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0405', 'PATELLA-RT( LAT, SKYLINE OR SUN RISE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0406', 'PATELLA-LT( LAT, SKYLINE OR SUN RISE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0501', 'LEG-RT(AP)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0502', 'LEG-LT(AP)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0503', 'LEG-BOTH(AP)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0504', 'LEG-RT(LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0505', 'LEG-LT(LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0506', 'LEG-BOTH(LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0507', 'LEG-RT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0508', 'LEG-LT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0601', 'ANKLE-RT(AP)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0602', 'ANKLE-LT(AP)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0603', 'ANKLE-BOTH(AP)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0604', 'ANKLE-RT(LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0605', 'ANKLE-LT(LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0606', 'ANKLE-BOTH(LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0607', 'ANKLE-RT(MORTISE)', 'XRAY', 'LOWER', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0608', 'ANKLE-LT(MORTISE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0609', 'ANKLE-BOTH(MORTISE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0610', 'ANKLE-RT( VARUS STRESS)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0611', 'ANKLE-LT( VARUS STRESS)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0612', 'ANKLE-RT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0613', 'ANKLE-LT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0614', 'ANKLE-RT(AP, LAT, MORTISE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0615', 'ANKLE-LT(AP, LAT, MORTISE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0616', 'ANKLE-RT(OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0617', 'ANKLE-LT(OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0618', 'ANKLE-RT(AP,LAT,OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0619', 'ANKLE-LT(AP,LAT,OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0701', 'FOOT-RT(AP)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0702', 'FOOT-LT(AP)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0703', 'FOOT-BOTH(AP)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0704', 'FOOT-RT(LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0705', 'FOOT-LT(LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0706', 'FOOT-BOTH(LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0707', 'FOOT-RT(OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0708', 'FOOT-LT(OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0709', 'FOOT-BOTH(OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L0710', 'FOOT-RT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0711', 'FOOT-LT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0712', 'FOOT-BOTH(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0713', 'FOOT-RT(AP, OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0714', 'FOOT-LT(AP, OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0715', 'FOOT-BOTH(AP,OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0716', 'FOOT-RT-WEIGHT-BEARING(AP, LAT STANDING)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0717', 'FOOT-LT-WEIGH-BEARING(AP, LAT STANDING)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0718', 'FOOT-BOTH-WEIGHT-BEARING(AP, LAT STAND)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0801', 'BIG TOE-RT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0802', 'BIG TOE-RT(AP, OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0803', 'BIG TOE-LT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0804', 'BIG TOE-LT(AP, OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0901', 'SECOND TOE-RT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0902', 'SECOND TOE-RT(AP, OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0903', 'SECOND TOE-LT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L0904', 'SECOND TOE-LT(AP, OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1001', 'THIRD TOE-RT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1002', 'THIRD TOE-RT(AP, OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1003', 'THIRD TOE-LT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1004', 'THIRD TOE-LT(AP, OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1101', 'FORTH TOE-RT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1102', 'FORTH TOE-RT(AP, OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1103', 'FORTH TOE-LT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1104', 'FORTH TOE-LT(AP, OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1201', 'FIFTH TOE-RT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1202', 'FIFTH TOE-RT(AP, OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1203', 'FIFTH TOE-LT(AP, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1204', 'FIFTH TOE-LT(AP, OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1301', 'CALCANEUS-RT(AXIAL, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1302', 'CALCANEUS-LT(AXIAL, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1303', 'CALCANEUS-BOTH(AXIAL)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L1304', 'CALCANEUS-BOTH(LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1305', 'CALCANEUS-BOTH(AXIAL, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'L1306', 'TALUS-RT(AP 15, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'L1307', 'TALUS-LT(AP 15, LAT)', 'XRAY', 'LOWER EXTREMITY', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'M0101', 'MRI-BRAIN', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0102', 'MRI-BRAINIAC', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0103', 'MRI-BRAIN+PITUITARY GLAND', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0104', 'MRI-BRAIN NAVIGATOR', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0105', 'MRI-STROKE PACKAGE', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0106', 'MR-PERFUSION BRAIN', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0107', 'MRI-BRAIN+PERFUSION', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0108', 'MRI-FOR EPILEPSY', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0109', 'MRI-FOR DEMENTIA', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0110', 'MRI-BASE OF SKULL', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0111', 'MRI-CAVERNOUS SINUS', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0112', 'MRI-IAC(ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0113', 'MRI-CN V', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0114', 'MRI-PITUITARY GLAND', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0115', 'MRI-CSF FLOW (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0116', 'MRI-BRAIN+CSF FLOW', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0117', 'MRI-CISTERNOGRAM (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0118', 'MRI-BRAIN+CISTERNOGRAM', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0119', 'MR SRT or SRS (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0120', 'MR-TRACTOGRAPHY', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0121', 'MRI-BRAIN+ORBITS', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0201', 'MRI-ORBITS.', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0202', 'MRI-T-M JOINT', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0203', 'MRI-NECK', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0204', 'MRI-NASOPHARYNX', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0205', 'MRI-SALIVARY GLAND', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0206', 'MRI-OROPHARYNX', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0207', 'MRI-LARYNX (NECK)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0208', 'MRI-THYROID', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0209', 'MRI-PARANASAL SINUS', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0210', 'MRI-MANDIBLE', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0211', 'MRI-ORAL CAVITY', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0301', 'MRI-CERVICAL SPINE', 'MRI', 'SPINE', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0302', 'MRI-CERVICO-THORACIC SPINE', 'MRI', 'SPINE', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0303', 'MRI-THORACIC SPINE', 'MRI', 'SPINE', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0304', 'MRI-THORACO-LUMBAR SPINE', 'MRI', 'SPINE', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0305', 'MRI-LUMBAR SPINE', 'MRI', 'SPINE', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0306', 'MRI-SACRAL', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0307', 'MRI-WHOLE SPINE', 'MRI', 'SPINE', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0308', 'MR-MYELOGRAM CERVICLE PART(ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0309', 'MR-MYELOGRAM THORACIC PART(ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0310', 'MR-MYELOGRAM LUMBAR PART(ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0311', 'MRI-BRACHIAL PLEXUS (NEURO)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0312', 'MRI-SCREENING SPINE', 'MRI', 'SPINE', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0313', 'MRI-LUMBAR PLEXUS', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0314', 'MRI-SACRAL PLEXUS', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0401', 'MRI-CHEST/THORAX', 'MRI', 'CHEST', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0402', 'MRI-MEDIASTINUM', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0403', 'MRI-BILIARY SYSTEM(MRCP)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0404', 'MRI-UPPER ABDOMEN', 'MRI', 'ABDOMEN', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0405', 'MRI-UPPER ABDOMEN+MRCP', 'MRI', 'ABDOMEN', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0406', 'MRI-LOWER ABDOMEN OR PELVIS', 'MRI', 'PELVIS', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0407', 'MRI-WHOLE ABDOMEN', 'MRI', 'ABDOMEN', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0408', 'MRI-LIVER', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0409', 'MRI-PANCREASE', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0410', 'MRI-ADRENAL GLAND', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0411', 'MRI-KIDNEY', 'MRI', 'ABDOMEN', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0412', 'MRI-PROSTATE GLAND', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0413', 'MRI-PROSTATE GLAND+ENDORECTAL COIL', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0414', 'MRI-PROSTATE CA  EVALATION', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0415', 'MRI-PELVIC CAVITY', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0416', 'MRI-PYELOGRAM', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0501', 'MRI-HEART COMPLETE', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0502', 'MRI-SCREENING CORONARY', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0503', 'MRI-HEART PERFUSION (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0504', 'MRI-Congenital Heart Disease', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0505', 'MRI-HEART (Limited) (Case ASD Screening)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0506', 'MRI-HEART+ Cine', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0);
INSERT INTO `xray_code` (`CENTER`, `XRAY_CODE`, `DESCRIPTION`, `XRAY_TYPE_CODE`, `BODY_PART`, `CHARGE_TOTAL`, `PORTABLE_CHARGE`, `DF`, `TIME_USE`, `BIRAD_FLAG`, `PREP_ID`, `DELETE_FLAG`) VALUES
('THAIRIS', 'M0601', 'MRI-BREAST UNILATERAL', 'MRI', 'BREAST', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0602', 'MRI-BREAST BILATERAL', 'MRI', 'BREAST', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0603', 'MRI-GUIDE BREAST BIOPSY PROCEDURE', 'MRI', 'BREAST', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0701', 'MRI-CLAVICLE', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0702', 'MR ARTHROGRAPHY', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0703', 'MRI-SHOULDER-RT', 'MRI', 'SHOULDER', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0704', 'MRI-SHOULDER-LT', 'MRI', 'SHOULDER', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0705', 'MRI-HUMERUS-RT', 'MRI', 'UPPER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0706', 'MRI-HUMERUS-LT', 'MRI', 'UPPER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0707', 'MRI-ELBOW-RT', 'MRI', 'UPPER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0708', 'MRI-ELBOW-LT', 'MRI', 'UPPER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0709', 'MRI-FOREARM-RT', 'MRI', 'UPPER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0710', 'MRI-FOREARM-LT', 'MRI', 'UPPER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0711', 'MRI-WRIST-RT', 'MRI', 'UPPER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0712', 'MRI-WRIST-LT', 'MRI', 'UPPER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0713', 'MRI-HAND-RT', 'MRI', 'UPPER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0714', 'MRI-HAND-LT', 'MRI', 'UPPER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0715', 'MRI-HIP-RT', 'MRI', 'PELVIS', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0716', 'MRI-HIP-LT', 'MRI', 'PELVIS', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0717', 'MRI-PELVIC BONE ORTHO', 'MRI', 'PELVIS', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0718', 'MRI-FEMUR OR THIGH-RT', 'MRI', 'LOWER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0719', 'MRI-FEMUR OR THIGH-LT', 'MRI', 'LOWER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0720', 'MRI-KNEE-RT', 'MRI', 'LOWER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0721', 'MRI-KNEE-LT', 'MRI', 'LOWER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0722', 'MRI-LEG-RT', 'MRI', 'LOWER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0723', 'MRI-LEG-LT', 'MRI', 'LOWER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0724', 'MRI-ANKLE-RT', 'MRI', 'LOWER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0725', 'MRI-ANKLE-LT', 'MRI', 'LOWER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0726', 'MRI-FOOT-RT', 'MRI', 'LOWER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0727', 'MRI-FOOT-LT', 'MRI', 'LOWER EXTREMITY', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0728', 'MRI-CALCANOUSE-RT', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0729', 'MRI-CALCANOUSE-LT', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0801', 'MRA-BRAIN ( CIRCLE OF WILLIS ONLY)', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0802', 'MRA-NECK (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0803', 'MRA-BRAIN AND NECK (ONLY)', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0804', 'MRA-HEART (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0805', 'MRA-CHEST /THORAX (ONLY)', 'MRI', 'CHEST', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0806', 'MRA-THORACIC AORTA (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0807', 'MRA-ABDOMINAL AORTA (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0808', 'MRA-WHOLE AORTA (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0809', 'MRA-ABDOMEN (ONLY)', 'MRI', 'ABDOMEN', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0810', 'MRA-HEPATIC ARTERY(ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0811', 'MRA-RENAL ARTERY(ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0812', 'MRA-CERVICAL SPINE', 'MRI', 'SPINE', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0813', 'MRA-CERVICOTHORACIC SPINE', 'MRI', 'SPINE', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0814', 'MRA-THORACIC SPINE', 'MRI', 'SPINE', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0815', 'MRA-THORACOLUMBAR SPINE', 'MRI', 'SPINE', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0816', 'MRA-LUMBOSACRAL SPINE', 'MRI', 'SPINE', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0817', 'MRA-UPPER EXTREMITY-RT(ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0818', 'MRA-UPPER EXTREMITY-LT(ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0819', 'MRA-LOWER EXTREMITY-RT(ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0820', 'MRA-LOWER EXTREMITY-LT(ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0821', 'MRA PERIPERAL RUN-OFF(ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0822', 'MRA-OTHER(SEE NOTE)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0901', 'MRV-BRAIN (ONLY)', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0902', 'MRV-THORAX (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0903', 'MRV-PORTAL VEIN (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0904', 'MRV-RENAL VEIN (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0905', 'MRV-ABDOMEN (ONLY)', 'MRI', 'ABDOMEN', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0906', 'MRV-UPPER EXTREMITY-RT (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0907', 'MRV-UPPER EXTREMITY-LT (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0908', 'MRV-LOWER EXTREMITY-RT (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0909', 'MRV-LOWER EXTREMITY-LT (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0910', 'MRV-LOWER EXTREMITY-BOTH (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M0911', 'MRV-OTHER(SEE NOTE)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M1001', 'MRI+MRA-BRAIN', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M1101', 'MRI+MRV-BRAIN', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M1201', 'MRI+MRA+MRV-BRAIN', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M1202', 'MRI+MRA+MRV-BRAIN CONTRAST ', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M1301', 'MR-SPECTROSCOPY-BRAIN (ONLY)', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M1302', 'MRI+MR-SPECTROSCOPY-BRAIN', 'MRI', 'HEAD', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M1303', 'MR-SPECTROSCOPY-PROSTATE GLAND (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M1304', 'MRI+MR-SPECTROSCOPY-PROSTATE GLAND', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M1305', 'MR-SPECTROSCOPY-BREAST (ONLY)', 'MRI', 'BREAST', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M1306', 'MRI+MR-SPECTROSCOPY-BREAST (ONLY)', 'MRI', 'BREAST', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M1307', 'MR-SPECTROSCOPY-LIVER (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M1308', 'MRI+MR-SPECTROSCOPY-LIVER', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M1309', 'MR-SPECTROSCOPY-MUSCLE (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M1310', 'MR SPECTROSCOPY(ONLY) OTHER', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M1401', 'FUNCTIONAL MRI (ONLY)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'M1501', 'MRI-OTHER(SEE NOTE)', 'MRI', '', 20000, 0, 5000, 30, '0', '', 0),
('THAIRIS', 'MM101', 'MAMMOGRAM-RT', 'MAMMO', 'BREAST', 3000, 0, 1000, 20, '1', '', 0),
('THAIRIS', 'MM102', 'MAMMOGRAM-LT', 'MAMMO', 'BREAST', 3000, 0, 1000, 20, '1', '', 0),
('THAIRIS', 'MM103', 'MAMMOGRAM-BOTH', 'MAMMO', 'BREAST', 3000, 0, 1000, 30, '1', '', 0),
('THAIRIS', 'MM104', 'MAMMOGRAM-IMPLANTATION', 'MAMMO', 'BREAST', 3000, 0, 1000, 30, '1', '', 0),
('THAIRIS', 'MM105', 'MAMMOGRAM-SPECIMEN', 'MAMMO', 'BREAST', 3000, 0, 1000, 20, '1', '', 0),
('THAIRIS', 'S0101', 'ODENTOID PROCESS (OPEN MOUTH)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0201', 'C-SPINE(AP)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0202', 'C-SPINE(LAT)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0203', 'C-SPINE(AP, LAT)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0204', 'C-SPINE(AP, LAT, OPEN MOUTH)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0205', 'C-SPINE(AP, LAT, BOTH OBLIQUE)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0206', 'C-SPINE FLEXION, EXTENSION', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0207', 'C-SPINE(BOTH OBLIQUE)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0301', 'C-T-SPINE(AP)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0302', 'C-T-SPINE(LAT)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0303', 'C-T-SPINE(SWIMER''S)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0304', 'C-T-SPINE(AP, LAT)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0305', 'C-T-SPINE(AP, LAT, BOTH OBLIQUE)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0401', 'T-SPINE(AP)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0402', 'T-SPINE(LAT)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0403', 'T-SPINE(AP, LAT)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0404', 'T-SPINE(BOTH OBLIQUE)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0405', 'T-SPINE(AP, LAT, BOTH OBLIQUE)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0406', 'T-SPINE STANDING(AP)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0407', 'T-SPINE STANDING(LAT)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0408', 'T-SPINE STANDING(AP, LAT)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0409', 'T-SPINE STANDING(AP, LAT, BOTH OBLIQUE)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0410', 'T-SPINE(FLEXION, EXTENSION)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0501', 'T-L SPINE(AP)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0502', 'T-L SPINE(LAT)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0503', 'T-L SPINE(AP, LAT)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0504', 'T-L SPINE(BOTH OBLIQUE)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0505', 'T-L SPINE(AP, LAT, BOTH OBLIQUE)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0506', 'T-L SPINE STANDING(AP)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0507', 'T-L SPINE STANDING(LAT)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0508', 'T-L SPINE STANDING(AP, LAT)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0509', 'T-L SPINE STANDING(BOTH OBLIQUE)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0510', 'T-L SPINE STANDING(AP,LAT,BOTH OBLIQUE)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0511', 'T-L SPINE STANDING(FLEXION, EXTENSION)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0512', 'T-L SPINE STANDING(BENDING)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0513', 'T-L SPINE STANDING(RT BENDING)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0514', 'T-L SPINE STANDING(LT BENDING)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0515', 'T-L SPINE ( SPOT T12-L1)(AP, LAT)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0601', 'L-S SPINE(AP)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0602', 'L-S SPINE(LAT)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0603', 'L-S SPINE(AP, LAT)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0604', 'L-S SPINE(BOTH OBLIQUE)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0605', 'L-S SPINE(AP, LAT, BOTH OBLIQUE)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0606', 'L-S SPINE STANDING(AP)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0607', 'L-S SPINE STANDING(LAT)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0608', 'L-S SPINE STANDING(AP, LAT)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0609', 'L-S SPINE STANDING(BOTH OBLIQUE)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0610', 'L-S SPINE STANDING(AP,LAT,BOTH OBLIQUE)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0611', 'L-S SPINE STANDING(BENDING)', 'XRAY', 'SPINE', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0612', 'L-S SPINE(FLEXION, EXTENSION)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0613', 'WHOLE SPINE(AP)(SCOLIOTIC)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0614', 'WHOLE SPINE(AP,LAT)(SCOLIOTIC)', 'XRAY', 'SPINE', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0701', 'SACRUM(AP)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0702', 'SACRUM(LAT)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0703', 'SACRUM(AP, LAT)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0801', 'S-I JOINT(AP)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0802', 'S-I JOINT-RT(AP, OBLIQUE)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0803', 'S-I JOINT-LT(AP, OBLIQUE)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0804', 'S-I JOINT-BOTH(AP, OBLIQUE)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'S0901', 'COCCYX(AP)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0902', 'COCCYX(LAT)', 'XRAY', '', 200, 0, 90, 10, '0', '', 0),
('THAIRIS', 'S0903', 'COCCYX(AP, LAT)', 'XRAY', '', 200, 0, 90, 15, '0', '', 0),
('THAIRIS', 'U0101', 'US.HEAD OR CRANIAL', 'US', 'HEAD', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0102', 'US.SALIVARY GLAND', 'US', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0103', 'US.THYROID', 'US', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0104', 'US.CHEST', 'US', 'CHEST', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0105', 'US.BREAST-RT', 'US', 'BREAST', 2000, 0, 500, 30, '1', '', 0),
('THAIRIS', 'U0106', 'US.BREAST-LT', 'US', 'BREAST', 2000, 0, 500, 30, '1', '', 0),
('THAIRIS', 'U0107', 'US.BREAST-BOTH', 'US', 'BREAST', 2000, 0, 500, 30, '1', '', 0),
('THAIRIS', 'U0108', 'US.UPPER ABDOMEN', 'US', 'ABDOMEN', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0109', 'US.LOWER ABDOMEN', 'US', 'ABDOMEN', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0110', 'US.WHOLE ABDOMEN', 'US', 'ABDOMEN', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0111', 'US.LIVER', 'US', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0112', 'US.KIDNEY', 'US', 'ABDOMEN', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0113', 'US.KUB', 'US', 'ABDOMEN', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0114', 'US.BLADDER', 'US', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0115', 'US.SCROTUM OR TESTIS', 'US', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0116', 'US.PROSTATE', 'US', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0117', 'US.FOLLICLE', 'US', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0118', 'US.ADRENAL GLAND', 'US', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0119', 'US.APPENDIX', 'US', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0120', 'US.TRANSPLANT KIDNEY BOTH SIDE', 'US', 'ABDOMEN', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0121', 'US.TRANSPLANT KIDNEY ONE SIDE', 'US', 'ABDOMEN', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0122', 'US.TRANSRECTAL', 'US', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0123', 'US.OBSTETRICS', 'US', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0124', 'US.AMNIOCENTASIS', 'US', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0125', 'US.OBSTETRICS For Kid', 'US', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0126', 'US.OBSTETRICS FOLLOW UP', 'US', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0127', 'US.BACK', 'US', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'U0201', 'DOPPLER CAROTID ARTERY', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0202', 'DOPPLER OF CAROTID SYSTEM', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0203', 'DOPPLER OF BOTH CAROTID SYSTEM', 'US', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'U0204', 'DOPPLER OF RIGHT SUBCLAVIAN', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0205', 'DOPPLER OF LEFT SUBCLAVIAN', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0206', 'DOPPLER OF KIDNEY', 'US', 'ABDOMEN', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0207', 'DOPPLER RENAL ARTERY', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0208', 'DOPPLER OF-BOTH SUBCLAVIAN', 'US', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'U0209', 'DOPPLER OF RENAL VESSELS', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0210', 'DOPPLER OF TRANSPANT KIDNEY(BILAT)', 'US', 'ABDOMEN', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0211', 'DOPPLER OF TRANSPANT KIDNEY(UNILAT)', 'US', 'ABDOMEN', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0212', 'DOPPLER ABDOMEN', 'US', 'ABDOMEN', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0213', 'DOPPLER OF HEPATOBILINARY SYSTEM', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0214', 'DOPPLER OF TESTIS', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0215', 'DOPPLER ARTERY OF UPPER EXTREMITY-RT', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0216', 'DOPPLER ARTERY OF UPPER EXTREMITY-LT', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0217', 'DOPPLER ARTERY OF UPPER EXTREMITY-BOTH', 'US', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'U0218', 'DOPPLER DEEP VEIN OF UPPER EXTREMITY-RT', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0219', 'DOPPLER DEEP VEIN OF UPPER EXTREMITY-LT', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0220', 'DOPPLER DEEP VEIN OF UPPER EXT.-BOTH', 'US', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'U0221', 'DOPLER-LEG-RT', 'US', 'LOWER EXTREMITY', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0222', 'DOPLER-LEG-LT', 'US', 'LOWER EXTREMITY', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0223', 'DOPLER-LEG-BOTH', 'US', 'LOWER EXTREMITY', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0224', 'DOPPLER-ARTERY OF LEG-RT', 'US', 'LOWER EXTREMITY', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0225', 'DOPPLER-ARTERY OF LEG-LT', 'US', 'LOWER EXTREMITY', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0226', 'DOPPLER-ARTERY OF LEG-BOTH', 'US', 'LOWER EXTREMITY', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'U0227', 'DOPPLER DVT-LEG-RT', 'US', 'LOWER EXTREMITY', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0228', 'DOPPLER DVT-LEG-LT', 'US', 'LOWER EXTREMITY', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0229', 'DOPPLER DVT-LEG-BOTH', 'US', 'LOWER EXTREMITY', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'U0230', 'DOPPLER ARTERY OF LOWER EXTREMITY-RT', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0231', 'DOPPLER ARTERY OF LOWER EXTREMITY-LT', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0232', 'DOPPLER ARTERY OF LOWER EXTREMITY-BOTH', 'US', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'U0233', 'DOPPLER DEEP VEIN OF LOWER EXTREMITY-RT', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0234', 'DOPPLER DEEP VEIN OF LOWER EXTREMITY-LT', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0235', 'DOPPLER DEEP VEIN OF LOWER EXT.-BOTH', 'US', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'U0236', 'DOPPLER ARTERIAL-BOTH', 'US', '', 5000, 0, 1000, 60, '0', '', 0),
('THAIRIS', 'U0301', 'US.OTHER', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0302', 'US.MASS', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'U0401', 'ULTRASOUND 4D', 'US', '', 5000, 0, 1000, 30, '0', '', 0),
('THAIRIS', 'X0101', 'SIALOGRAM', 'FLUORO', '', 2000, 0, 500, 90, '0', '', 0),
('THAIRIS', 'X0102', 'MYELOGRAM', 'FLUORO', '', 2000, 0, 500, 90, '0', '', 0),
('THAIRIS', 'X0103', 'ERCP', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0104', 'UGI', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0105', 'LONG GI', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0106', 'BARIUM SWALLOW', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0107', 'BARIUM SWALLOW, GI', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0108', 'BE ( DOUBLE AIR CONTRAST)', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0109', 'BE ( SINGLE CONTRAST)', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0110', 'IVP ', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0111', 'RAPID SEQUENCE IVP', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0112', 'VOIDING CYSTOGRAM', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0113', 'RETROGRADE URETHOGRAM', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0114', 'RETROGRADE PYELOGRAM', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0115', 'HYSTEROSALPINGOGRAM', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0116', 'T-TUBE CHOLANGIOGRAM', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0117', 'FISTULOGRAM', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0118', 'VENOGRAM', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0119', 'ARTHOGRAM', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0120', 'FLU IN OR', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0121', 'FLUOROSCOPY', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'X0122', 'OTHER OF SPECIAL XRAY', 'FLUORO', '', 2000, 0, 500, 30, '0', '', 0),
('THAIRIS', 'XRTX0201', 'CEREBRAL ANGIOGRAM(4 VESSELS)', 'ANGIO', '', 30000, 0, 10000, 60, '0', '', 0),
('THAIRIS', 'XRTX0202', 'CAROTID ARTERY ANGIOGRAM', 'ANGIO', '', 30000, 0, 10000, 60, '0', '', 0),
('THAIRIS', 'XRTX0203', 'SUBCLAVIAN ARTERY ANGIOGRAM', 'ANGIO', '', 30000, 0, 10000, 60, '0', '', 0),
('THAIRIS', 'XRTX0204', 'THORACIC AORTA ANGIOGRAM', 'ANGIO', '', 30000, 0, 10000, 60, '0', '', 0),
('THAIRIS', 'XRTX0205', 'ABDOMINAL AORTA ANGIOGRAM', 'ANGIO', '', 30000, 0, 10000, 60, '0', '', 0),
('THAIRIS', 'XRTX0206', 'RENAL ARTERY ANGIOGRAM', 'ANGIO', '', 30000, 0, 10000, 60, '0', '', 0),
('THAIRIS', 'XRTX0207', 'UPPER EXTREMITY ANGIOGRAM', 'ANGIO', '', 30000, 0, 10000, 60, '0', '', 0),
('THAIRIS', 'XRTX0208', 'LOWER EXTREMITY ANGIOGRAM', 'ANGIO', '', 30000, 0, 10000, 60, '0', '', 0),
('THAIRIS', 'XRTX0209', 'OTHER ANGIOGRAM ', 'ANGIO', '', 30000, 0, 10000, 60, '0', '', 0),
('THAIRIS', 'XRTX0301', 'TOCE', 'ANGIO', '', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0302', 'PTBD', 'ANGIO', '', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0303', 'PTC', 'ANGIO', '', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0304', 'PEIT', 'ANGIO', '', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0305', 'PCN ', 'ANGIO', '', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0306', 'RFA', 'ANGIO', '', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0307', 'EMBOLIZATION', 'ANGIO', '', 30000, 0, 10000, 60, '0', '', 0),
('THAIRIS', 'XRTX0308', 'ANGILOPLASTY', 'ANGIO', '', 30000, 0, 10000, 60, '0', '', 0),
('THAIRIS', 'XRTX0309', 'OTHER INTERVENTION RADIOTHERAPY', 'ANGIO', '', 30000, 0, 10000, 60, '0', '', 0),
('THAIRIS', 'XRTX0310', 'DSA FOR ANGIOGRAM CASE', 'ANGIO', '', 30000, 0, 10000, 60, '0', '', 0),
('THAIRIS', 'XRTX0401', 'BIOPSY BREAST-RT', 'ANGIO', 'BREAST', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0402', 'BIOPSY BREAST-LT', 'ANGIO', 'BREAST', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0403', 'BIOPSY LUNG', 'ANGIO', 'CHEST', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0404', 'BIOPSY LIVER', 'ANGIO', 'ABDOMEN', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0405', 'BIOPSY KIDNEY-RT', 'ANGIO', 'ABDOMEN', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0406', 'BIOPSY KIDNEY-LT', 'ANGIO', 'ABDOMEN', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0407', 'BIOPSY OTHER', 'ANGIO', 'OTHER', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0501', 'FNA BREAST-RT', 'ANGIO', 'BREAST', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0502', 'FNA BREAST-LT', 'ANGIO', 'BREAST', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0503', 'FNA LUNG', 'ANGIO', 'CHEST', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0504', 'FNA LIVER', 'ANGIO', 'ABDOMEN', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0505', 'FNA KIDNEY-RT', 'ANGIO', 'ABDOMEN', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0506', 'FNA KIDNEY-LT', 'ANGIO', 'ABDOMEN', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0507', 'FNA OTHER', 'ANGIO', '', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0601', 'LOCALIZATION BREAST-RT', 'ANGIO', 'BREAST', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0602', 'LOCALIZATION BREAST-LT', 'ANGIO', 'BREAST', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0603', 'LOCALIZATION LUNG', 'ANGIO', '', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0604', 'LOCALIZATION LIVER', 'ANGIO', '', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0605', 'LOCALIZATION KIDNEY-RT', 'ANGIO', 'ABDOMEN', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0606', 'LOCALIZATION KIDNEY-LT', 'ANGIO', 'ABDOMEN', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0607', 'LOCALIZATION  OTHER', 'ANGIO', '', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0701', 'DUCTOGRAM BREAST-RT', 'ANGIO', 'BREAST', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', 'XRTX0702', 'DUCTOGRAM BREAST-LT', 'ANGIO', 'BREAST', 30000, 0, 10000, 30, '0', '', 0),
('THAIRIS', '10046', 'ct  scan', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1040', 'ADDITIONAL MULTIPHASE', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1041', 'ADDITIONAL SUFACE 3D VIEWS', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1001', 'CT BRAIN NON CONTRAST', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1002', 'CT BRAIN WITH CONTRAST', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1003', 'CT CHEST(NC)', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1005', 'CT FACIAL BONE', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1008', 'CT LARYNX ', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1009', 'CT NASOPHARYNX', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1010', 'CT NECK', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1012', 'CT SCREENING PARANASAL SINUSES', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1013', 'CT PARANASAL SINUSES WITH CONTRAST', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1014', 'CT PITUITARY GLAND', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1015', 'CT PAROTID GLAND', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1016', 'CT UPPER ABDOMEN +NONIONIC CONTRAST', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1017', 'CT UPPER ABDOMEN', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1018', 'CT LOWER ABDOMEN+NONIONIC CONTRAST', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1019', 'CT LOWER ABDOMEN', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1020', 'CT ORBIT', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1024', 'CT THYROID', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1025', 'CT WHOLE ABDOMEN+NONIONIC CONTRAST', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1026', 'CT WHOLE ABDOMEN ( SCREENING )', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1027', 'CT WHOLE ABDOMEN + CT COLONOSCOPY', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1028', 'CTA BRAIN', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1029', 'CTA CAROTID ARTERY', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1030', 'CTA PULMONARY ARTERY', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1031', 'CTA RENAL ARTERY', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1032', 'CTA THORACIC AORTA', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1033', 'CTA ABDOMINAL AORTA', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1034', 'CTA WHOLE AORTA', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1035', 'CTA FEMORAL ARTERY', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1036', 'CTA LOWER EXTERMITY', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1037', 'CTA LEGS', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1039', 'CT GUIDED BIOPSY', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10047', 'ABDO Test Test', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10048', 'CT C-SPINE', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10049', 'CT L-S SPINE', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10050', 'CT ANKLE', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10051', 'CT CALCANEOUS', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10052', 'CT ELBOW', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10053', 'CT FOOT', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10054', 'CT T- SPINE', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10055', 'CT FEMUR', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10056', 'CT KNEE', 'CT', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10057', 'CT LEG', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10058', 'CT KUB', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10059', 'CT MANDIBLE', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10060', 'CT MYELOGRAM', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10061', 'CT PELVIS', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10062', 'CT SHOULDER (LT)', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10063', 'CT SCAPULA', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10064', 'CT HIP', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10065', 'CT TIBIA', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10066', 'CT CHEST', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10067', 'CT IAC / TEMPORAL BONE', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10073', 'CT HRCT', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10078', 'CT KUB (NC)', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10080', 'CT WHOLE AORTA', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10076', 'CT ARM (RT)', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10071', 'CONTRAST', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10072', 'CT HRCT+CHEST (NON CONTRAST)', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10075', 'CT SHOULDER (RT)', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10084', 'CT HUMERUS', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10077', 'CTV WHOLE ABDOMEN', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10079', 'CT NECK (NC)', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10074', 'CT ARM (LT)', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10069', 'CTA CHEST', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1004', 'CT CHEST+HRCT', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '1038', 'CTA Coronary artery', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10068', 'CTA ARM', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10081', 'CT WRIST', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '10082', 'CTA NECK', 'CT', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2012', 'MRI CHEST', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2013', 'MRI C-SPINE', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2014', 'MRI T-SPINE', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2015', 'MRI L-S SPINE', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2017', 'MRI HEART + PERFUSION', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2018', 'MRI HEART+STRESS TEST', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2022', 'MRI LIVER WITH DOUBLE CONTRAST', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2023', 'MRI LOWER ABDOMEN', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2025', 'MRI NECK', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2026', 'MRI ORBIT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2027', 'MRI PARANASAL SINUSES', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2028', 'MRI PITUITARY GLAND', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2029', 'MRI PROSTATE GLAND', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2030', 'MRI PROSTATE SPECIAL COIL', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2031', 'MRCP ', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2032', 'MR SPECTROSCOPY', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2033', 'MRI THYROID', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2034', 'MRI UPPER ABDOMEN', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2036', 'MRI UROGRAPHY', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2037', 'MRI WHOLE ABDOMEN', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2038', 'MRI WHOLE SPINES', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2040', 'MRA AORTA', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2041', 'MRA CORONARY ARTERY', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2043', 'MRA PULMONARY ARTERY', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2044', 'MRA RENAL ARTERY', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2046', 'MRV UPPER ABDOMEN', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2047', 'MRV LOWER ABDOMEN', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2048', 'MRV FEMORAL VEIN', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20050', 'MRS Prostate gland', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2001', 'MRI BRAIN', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2002', 'MRI BRAIN+MRA', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2003', 'MRI BRAIN+MRV ', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2004', 'MRI BRAIN+MRA+MRV', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2005', 'MRI RT.BREAST ', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2006', 'MRI BREAST LT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2007', 'MRI BOTH BREAST ', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2010', 'MRI EXTREMITY', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2011', 'MRI BOTH HIPS', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20056', 'MRI PRIMOVIST', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20061', 'MRI SHOULDER RT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20070', 'MRA BRAIN', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20073', ' MRI ARM  LT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20074', 'MRI ARM RT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20076', 'MRI LEG RT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20077', 'MRI THIGH RT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20085', 'MRI PAROTID GLAND RT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20088', 'MRI  1 SMALL PART OR SMALL ORGAN', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20150', 'CLAVICLE HEAD LT.', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20106', 'MRI KIDNEY', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20117', 'MRI COCCYX', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20119', 'MRI WRIST RT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20130', 'MRI TM JOINT ', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20142', 'MRI KUB', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20147', 'MRI  RT Foot', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20143', ' MRI. LT SCAPULAR', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20059', 'MRI FEMORAL ARTERy', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20080', 'MRV BRAIN', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20087', 'MRI FOOT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20122', 'MRI FUNCIONAL', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20062', 'MRI SHOULDER LT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20069', 'MRI FACE', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20079', 'MRI LIVER', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20095', 'MRI  BREAST  RT.', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20097', 'MRI ADRENAL GLAND', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20099', 'MRI BACK MASS', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20103', 'MRI HIP LT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20109', 'MRI BOTH LEG', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20114', 'MRI RT.SCIATIC NERVE', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20137', 'MRA Whole abdomen', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20138', 'MRI PANCREASE', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20063', 'MRI PELVIS', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20066', 'MRI SI JOINTs', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20078', 'MRI THIGH LT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20092', 'MR SRT OR SRS', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20093', 'MRI DEMENTIA PROTOCAL', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20100', 'MRI TL-SPINE', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20104', 'MRI HIP RT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20116', 'MRI  LT.ELBOW', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20094', 'MRI SACRUM BONE', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20132', 'MRA CAROTID', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20139', 'MRV PORTAL V.', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20129', 'MRI SACRAL PLEXUS', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20075', 'MRI LEG LT ', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20081', 'MRI WRIST', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20084', 'MRI PAROTID GLAND LT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20102', 'MRI  FEMER', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20107', 'MRI  RT.ELBOW  ', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20124', 'MRI MRA (NONBRAIN)', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20125', 'MRI BRAIN + CSF FLOW', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20127', 'MRI BRACHIAL PLEXUS', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20060', 'MRA FEMERAL ARTERY', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20118', 'MRI WRIST LT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20131', 'MRI OROPHARYNX', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20136', 'MRA UPPER /LOWER ABDOMEN', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20148', 'MRI  STERNUM', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20098', 'MRI HIPPOCAMPUS', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20128', 'MRI LS-PLEXUS', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20149', 'MRI CLAVICLE LT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20146', 'MRI  CRANIAL  NERVE', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20068', 'MRI MRA MRV NECK', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20071', 'MRI CISTERNOGRAM', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20089', 'MRI CAVERNOUS  SINUS', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20126', 'MRI CRANIAL NERVE', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20133', 'MRI THYROID GLANDS', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20144', 'MRA BOTH LEG', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20145', 'MRI  HIP', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20120', 'MRI RT Scapular', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20053', 'MRI KNEE LT', 'MRI', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20055', 'MRI CONTRASTจำนวน 3 ขวด', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20057', 'MRI HAND RT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20072', 'MRI ARM  RT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20108', 'MRI ANKLE LT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20110', 'MRA MAXILLA', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20121', 'MRI DIFFUSION /PERFUSION', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20123', 'MRV (ONE PART )', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20052', 'MRI KNEE RT', 'MRI', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20134', 'MRI MEDIASTINUM', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20135', 'MRI HEART CGHD/CINE', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2016', 'MRI HEART', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2019', 'MRI IAC', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2021', 'MRI LARYNX', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2024', 'MRI NASOPHARYNX', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2035', 'MRI UPPER ABDOMEN+MRCP', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '2045', 'MRV CHEST', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20151', 'MRI ELBOW RT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20051', 'MRI CONTRAST จำนวน  1 ขวด ', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20058', 'MRI HAND LT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20064', 'MRI ANKLE RT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20091', 'MRI AXILLARY', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20101', 'MRI CLAVICLE HEAD RT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20105', 'MRI BASE OF SKULL', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20115', 'MRI  LT.SCIATIC NERVE', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20140', 'MRI PELVIC CAVITY ', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20141', 'MR ARTHROGRAPHY', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '20152', 'MRI ELBOW LT', 'MRI', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '4001', 'ULTRASOUND DOPPLER LT. LEG', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '4002', 'ULTRASOUND DOPPLER CAROTID', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '4003', 'ULTRASOUND  DOPPLER RENAL', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '4005', 'ULTRASOUND KIDNEYS', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '4006', 'ULTRASOUND K.U.B.', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '4007', 'ULTRASOUND LOWER ABDOMEN', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '4008', 'ULTRASOUND NECK', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '4009', 'ULTRASOUND PELVIS', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '4010', 'ULTRASOUND PROSTATE ', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '4011', 'ULTRASOUND SCROTUM', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '4012', 'ULTRASOUND THYROID', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '4013', 'ULTRASOUND WHOLE ABDOMEN', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '4014', 'ULTRASOUND UPPER ABDOMEN', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '4015', 'ULTRASOUND ??????.(SMALL PART)', 'US', '0', 0, 0, 0, 0, 'B', 'PREP_ID', 0),
('THAIRIS', '4017', 'ULTRASOUND GUIDED FOR BIOPSY', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40018', 'ULTRASOUND  BRAIN', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40019', 'ULTRASOUND GUIED FOR PLEURAL EFFUSION TAPPING', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40020', 'ULTRASOUND LIVER', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40021', 'ULTRASOUND K.U.B+PROSTATE GlAND', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40025', 'ULTRASOUND DOPPLER BOTH LEGS', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40030', 'ULTRASOUND GALL BLADDER', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40026', 'ULTRASOUND DOPPLER RT.LEG', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40028', 'ULTRASOUND GUIDED FOR ABDOMINAL TAPPING', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40023', 'ULTRASOUND DOPPLER PORTAL VIEN', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40024', 'ULTRASOUND DOPPLER ARM', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40027', 'ULTRASOUND TESTIS', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40029', 'ULTRASOUND HEPATOBILLIARY SYSTEMS', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40032', 'ULTRASOUND DOPPLER ARTERY', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40031', 'testtest', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40022', 'ULTRASOUND PORTABLE', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40034', 'ULTRASOUND DOPPLER RT .ANKLE', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40035', 'ULTRASOUND DOPPLER LT.ANKLE', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '4004', 'ULTRASOUND BREAST', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '4016', 'ULTRASOUND DOPPLER AORTA', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '40033', 'ULTRASOUND DOPPLER VEIN', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50139', 'Test FOR MESSAGE', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50140', 'ABDOMEN PRONE (PA)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50141', 'ABDOMEN LT. LATERAL DECUBITUS', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50142', 'ABDOMEN RT. LATERAL DECUBITUS', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50143', '', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50144', 'ABDOMEN RT. LATERAL DORSAL DECUBITUS', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50145', 'ABDOMEN LATERAL SUPINE', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50146', 'ABDOMEN UPRIGHT (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50147', 'ABDOMEN LATERAL UPRIGHT', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50148', 'ANKLE BOTH (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50149', 'ANKLE BOTH (OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50150', 'ANKLE BOTH (MORTISE VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50152', 'ANKLE BOTH (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50156', 'ANKLE BOTH (STRESS VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50157', 'ANKLE BOTH (AP, LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50158', 'HAND RT. (PA, LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50159', 'ANKLE RT. (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50161', 'ANKLE RT. (MORTISE VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50162', 'ANKLE RT.(STRESS VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50164', 'ANKLE LT. (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50166', 'ANKLE LT. (MORTISE VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50167', 'ANKLE LT. (STRESS VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50168', 'COCCYX (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50169', 'COCCYX (AP, LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50170', 'C-SPINE (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50171', 'C-SPINE (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50172', 'C-SPINE (LT. OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50173', 'C-SPINE (RT. OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50174', 'C-SPINE (BOTH OBLIQUES)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50175', 'C-SPINE (FLEXION)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50176', 'C-SPINE (EXTENSION)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50177', 'C-SPINE (SWIMMER''S VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50178', 'C-SPINE (WAGGING JAW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50179', 'C-SPINE (DENS)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50180', 'C-SPINE (PILLARS)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50182', 'CALCANEUS LT. (AXIAL VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50183', 'CALCANEUS LT. (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50184', 'CALCANEUS BOTH (AXIAL VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50185', 'CALCANEUS BOTH (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50186', 'CALCANEUS BOTH (AXIAL VIEW, LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50187', 'CHEST (LT.LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50188', 'CHEST (RT.OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50189', 'CHEST (LT.OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50190', 'CLAVICLE BOTH (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50191', 'AC JOINT RT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50192', 'AC JOINT LT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50193', 'AC JOINT BOTH. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50194', 'AC JOINT WITH WEIGHT RT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50195', 'AC JOINT WITH WEIGHT LT.(AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50196', 'AC JOINT WITH WEIGHTS BOTH (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50197', 'ELBOW BOTH (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50198', 'ELBOW BOTH (AP, LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50199', 'CHEST (AP UPRIGHT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50200', 'ELBOW BOTH (JONES METHOD)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50201', 'ELBOW BOTH (COYLE METHOD)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50202', 'ELBOW RT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50203', 'ELBOW RT. (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50204', 'ELBOW RT. (AP, LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50206', 'ELBOW RT.(JONES METHOD)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0);
INSERT INTO `xray_code` (`CENTER`, `XRAY_CODE`, `DESCRIPTION`, `XRAY_TYPE_CODE`, `BODY_PART`, `CHARGE_TOTAL`, `PORTABLE_CHARGE`, `DF`, `TIME_USE`, `BIRAD_FLAG`, `PREP_ID`, `DELETE_FLAG`) VALUES
('THAIRIS', '50207', 'ELBOW RT.(COYLE METHOD)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50208', 'ELBOW LT. (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50209', 'ELBOW LT. (AP, LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50210', 'FINGER LT. (PA, LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50211', 'ELBOW LT. (JONES METHOD)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50212', 'FEMUR BOTH INCLUDE KNEE (LATERAL)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50213', 'FEMUR BOTH (AP, LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50214', 'FEMUR RT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50215', 'FEMUR RT. INCLUDE HIP (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50001', 'ABDOMEN SUPINE (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50002', 'ABDOMEN (SUPINE, UPRIGHT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50003', 'ACUTE ABDOMEN SERIES', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50006', 'HAND LT. (PA,LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50008', 'BONE AGE (LT.WRIST)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50011', 'C-SPINES (AP, LAT, BOTH OBLIQUES)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50014', 'C-SPINES (FLEXION, EXTENSION)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50016', 'CALCANEUS RT. (AXIAL VIEW, LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50018', 'CHEST (PA UPRIGHT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50019', 'CHEST (RT.LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50022', 'CHEST (LT.LATERAL DECUBITUS)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50023', 'CHEST (LORDOTIC VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50026', 'CLAVICLE RT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50028', 'ELBOW BOTH (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50029', 'ELBOW  LT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50030', 'ELBOW  LT. (COYLE METHOD)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50031', 'FEMUR BOTH (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50032', 'FEMUR BOTH INCLUDE HIP (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50033', 'FEMUR BOTH INCLUDE KNEE (AP)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50034', 'FEMUR BOTH (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50035', 'FOOT RT. (AP , OBLIQUE )', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50036', 'FOOT LT. (AP , OBLIQUE )', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50038', 'FOREARM RT. (AP , LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50040', 'GALL BLADDER PLAIN', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50041', 'HAND BOTH (PA , OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50043', 'HAND LT. (PA , OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50044', 'HIP BOTH (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50047', 'HIP RT. (LATERAL CROSSTABLE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50048', 'HIP LT. (LATERAL CROSSTABLE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50049', 'HIP RT. (FROG LEG)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50050', 'HIP LT. (FROG LEG)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50053', 'HUMERUS RT.(AP,LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50054', 'HUMERUS LT.(AP,LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50056', 'KNEE RT. (AP,LAT)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50057', 'KNEE LT. (AP,LATERAL VIEW)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50058', 'KNEE BOTH (AP,LATERAL VIEW)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50064', 'LEG BOTH (AP,LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50066', 'LEG LT. (AP,LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50067', 'LONG BONE', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50069', 'L-S SPINES (BOTH OBL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50071', 'MANDIBLE (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50072', 'MANDIBLE (AP,OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50074', 'NECK (SOFT TISSUE LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50075', 'MASTOID BOTH', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50076', 'MASTOID RT.', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50077', 'MASTIOID LT.', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50078', 'ORBIT BOTH', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50080', 'ORBIT LT.', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50082', 'PELVIS (INLET VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50085', 'PELVIS (JUDET VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50086', 'PELVIS (RIPSTEIN VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50088', 'SACRUM (AP , LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50089', 'STERNUM (PA , LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50093', 'SHOULDER LT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50097', 'SHOULDER BOTH (SUPRASPINATUS OUTLET VIEW )', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50098', 'SHOULDER RT. (SUPRASPINATUS OUTLET VIEW )', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50099', 'SHOULDER LT. (SUPRASPINATUS OUTLET VIEW )', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50102', 'SHOULDER LT. (STRYKER NOTCH)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50104', 'SHOULDER RT. (AXILLARY VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50105', 'SHOULDER LT. (AXILLARY VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50106', 'SHOULDER BOTH (TRANSCAPULAR)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50108', 'SHOULDER LT. (TRANSCAPULAR)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50109', 'SHOULDER BOTH (WEST POINT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50110', 'SHOULDER RT. (WEST POINT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50111', 'SHOULDER LT. (WEST POINT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50113', 'SCAPULAR RT. (AP, TRANSCAPULAR)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50114', 'SCAPULAR LT.', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50118', 'SKULL (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50120', 'SKULL SERIES (PA, LAT, TOWNE''S VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50122', 'SKULL (WATER''S VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50124', 'THORACIC SPINES (AP,LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50127', 'T-L SPINES (AP,LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50128', 'T-L SPINES (BOTH OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50129', 'T-L SPINES (FLEX,EXTESION)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50130', 'T-M JOINT BOTH', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50131', 'T-M JOINT RT.', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50133', 'WRIST BOTH (PA , LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50134', 'WRIST RT. (PA , LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50216', 'FEMUR RT. INCLUDE KNEE (AP)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50217', 'FEMUR RT. (AP,LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50218', 'FEMUR LT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50219', 'FEMUR LT. INCLUDE HIP (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50220', 'FEMUR LT. INCLUDE KNEE (AP)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50221', 'FEMUR LT. (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50222', 'FEMUR LT. INCLUDE HIP (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50223', 'FEMUR LT. INCLUDE KNEE (LATERAL)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50225', 'K.U.B.', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50226', 'L-S SPINES (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50228', 'ADENOID GLAND', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50233', 'FOOT RT. (OBLIQUE )', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50234', 'FOOT RT. (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50235', 'FEET BOTH (AP, OBLIQUE )', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50236', 'FEET BOTH (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50237', 'FEET BOTH (OBLIQUE )', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50240', 'FOOT LT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50242', 'FOOT LT. (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50246', 'ANKLE LT. (AP, LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50248', 'CALCANEUS RT. (AXIAL VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50249', 'CALCANEUS RT. (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50250', 'CALCANEUS LT. (AXIAL VIEW, LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50251', 'CHEST (AP SUPINE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50252', 'CHEST (SEMI- UPRIGTH)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50253', 'FEMUR RT. (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50254', 'FEMUR RT. INCLUDE HIP (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50255', 'FEMUR RT. INCLUDE KNEE (LATERAL)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50256', 'FEMUR BOTH INCLUDE HIP (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50257', 'FOOT RT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50258', 'FOREARM RT.(AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50259', 'FOREARM RT.(LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50260', 'FOREARM BOTH (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50261', 'FOREARMS BOTH (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50263', 'FOREARM LT.(AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50264', 'FOREARM LT.(LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50266', 'HAND RT. (PA )', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50267', 'HAND RT. (OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50269', 'HAND BOTH (PA )', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50270', 'HAND BOTH (OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50272', 'HAND LT. (PA )', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50273', 'HAND LT. (OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50275', 'HIP RT. (INTERNAL ROTATED)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50276', 'HIP RT. (EXTERNAL ROTATED)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50277', 'HIP BOTH (LATERAL CROSSTABLE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50278', 'HIP BOTH  (FROG LEG)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50279', 'HIP BOTH  (INTERNAL ROTATED)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50280', 'HIP BOTH  (EXTERNAL ROTATED)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50282', 'HIP LT. (INTERNAL ROTATED)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50283', 'HIP LT. (EXTERNAL ROTATED)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50285', 'KNEE RT. (AP)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50286', 'KNEE RT. ( LAT)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50387', 'ANKLE RT. (AP)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50403', 'RIBS RT. (OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50404', 'PELVIS (LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50392', 'SKULL (CALDWELL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50378', 'HIP (JUDET VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50386', 'WRIST RT. (CARPAL SERIES)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50385', 'WRIST LT.(CARPAL SERIES)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50205', 'FINGER RT. (PA, LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50379', 'HAND BOTH (LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50401', 'KNEE LT. (NOTCH VIEW)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50380', 'HAND RT. (LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50394', 'ELBOW LT. (RADIOCARPITELLAR)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50397', 'FEMUR LT. INCLUDE HIP (AP, LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50377', 'TOE RT. (AP,OBLIQUE)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50388', 'ANKLE LT. (AP)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50390', 'PARANASAL SINUSES', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50287', 'KNEE RT. (AP. STANDING , LAT)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50288', 'KNEE RT. (VALGUS)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50289', 'KNEE RT. (VARUS)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50290', 'KNEE RT. (ANTERIOR DRAWER STRESS)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50291', 'KNEE RT. (POSTERIOR DRAWER STRESS)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50292', 'KNEE BOTH  (SKYLINE)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50293', 'KNEE BOTH  (AP)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50294', 'KNEE BOTH  ( LAT)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50295', 'KNEE BOTH  (AP. STANDING , LAT)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50296', 'KNEE BOTH  (VALGUS)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50297', 'KNEE BOTH  (VARUS)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50298', 'KNEE BOTH  (ANTERIOR DRAWER STRESS)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50299', 'KNEE BOTH  (POSTERIOR DRAWER STRESS)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50300', 'KNEE LT. (SKYLINE)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50301', 'KNEE LT. (AP)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50302', 'KNEE LT. ( LAT)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50303', 'KNEE LT. (AP. STANDING , LAT)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50304', 'KNEE LT. (VALGUS)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50305', 'KNEE LT. (VARUS)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50306', 'KNEE LT. (ANTERIOR DRAWER STRESS)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50307', 'KNEE LT. (POSTERIOR DRAWER STRESS)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50308', 'L-S SPINES (BENDING)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50309', 'MANDIBLE (OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50310', 'RIBS (AP , OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50375', 'TOE LT. (AP,OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50389', 'PELVIS (OUTLET VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50393', 'ELBOW RT. (RADIOCARPITELLAR)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50311', 'RIBS (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50312', 'RIBS LT. (OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50313', 'S-I JOINT (AP , OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50315', 'SCAPULAR RT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50316', 'SCAPULAR RT. (TRANSCAPULAR)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50317', 'SCAPULAR BOTH (AP, TRANSCAPULAR)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50318', 'SCAPULAR BOTH (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50319', 'SCAPULAR BOTH (TRANSCAPULAR)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50321', 'SCAPULAR LT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50322', 'SCAPULAR LT. (TRANSCAPULAR)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50323', 'SHOULDER RT. (ROCKWOOD)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50327', 'SHOULDER RT. (STRYKER NOTCH)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50329', 'SHOULDER RT. (INTERNAL ROTATED)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50330', 'SHOULDER RT. (EXTERNAL ROTATED)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50332', 'SHOULDER BOTH (ROCKWOOD)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50336', 'SHOULDER BOTH (STRYKER NOTCH)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50338', 'SHOULDER BOTH (INTERNAL ROTATED)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50339', 'SHOULDER BOTH (EXTERNAL ROTATED)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50341', 'SHOULDER LT. (ROCKWOOD)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50347', 'SHOULDER LT. (INTERNAL ROTATED)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50348', 'SHOULDER LT. (EXTERNAL ROTATED)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50349', 'SKULL (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50350', 'SKULL (SUBMENTOVERTEX)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50354', 'THORACIC SPINES (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50355', 'THORACIC SPINES (LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50356', 'THORACIC SPINES (BOTH  OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50357', 'THORACIC SPINES (FLEXION , EXTESION)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50358', 'THORACIC SPINES (BENDING 2 VIEWS)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50359', 'T-L SPINES (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50360', 'T-L SPINES (LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50361', 'T-L SPINES (BENDING 2 VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50362', 'TRAUMA SERIES', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50382', 'HIP RT. (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50384', 'BABYGRAM', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50396', 'FEMUR RT. INCLUDE HIP (AP, LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50398', 'FEMUR LT. INCLUDE KNEE (AP, LATERAL)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50364', 'WRIST RT. (ULNAR DEVIATION)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50365', 'WRIST RT. (OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50366', 'WRIST RT.(CARPAL TUNNEL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50368', 'WRIST BOTH (ULNAR DEVIATION)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50369', 'WRIST BOTH (OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50370', 'WRIST BOTH (CARPAL TUNNEL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50372', 'WRIST LT. (ULNAR DEVIATION)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50373', 'WRIST LT. (OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50374', 'WRIST LT.(CARPAL TUNNEL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50407', 'FOOT RT. (AP,LAT)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50395', 'FEMUR RT. INCLUDE KNEE (AP, LATERAL)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50402', 'KNEE BOTH (AP STANDING)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50406', 'FOOT LT. (AP,LAT)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50408', 'FOOT BOTH (AP,LAT)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50224', 'FEMUR LT. (AP, LATERAL)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50227', 'L-S SPINES (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50238', 'FEET BOTH (LATERAL)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50241', 'FOOT LT. (OBLIQUE )', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50244', 'ANKLE RT. (AP, LATERAL)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50284', 'KNEE RT. (SKYLINE)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50062', 'KNEE BOTH (NOTCH VIEW)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50065', 'LEG RT. (AP,LAT)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50068', 'L-S SPINES (AP,LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50070', 'L-S SPINES (FLEXION, EXTESION)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50073', 'NASAL BONE ', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50079', 'ORBIT RT.', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50081', 'OPTIC FORAMEN', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50083', 'PELVIS (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50084', 'PELVIS (INLET,OUTLET)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50090', 'STYLOID PROCESS', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50091', 'SHOULDER BOTH (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50092', 'SHOULDER RT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50103', 'SHOULDER BOTH (AXILLARY VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50107', 'SHOULDER RT. (TRANSCAPULAR)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50119', 'SKULL (AP,LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50121', 'SKULL (TOWNE''S VIEW)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50376', 'KNEE LT.(AP,LAT)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50391', 'ORBIT (Moving eye)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50132', 'T-M JOINT LT.', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50135', 'WRIST LT. (PA , LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50009', 'COCCYX (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50010', 'C-SPINES (AP, LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50013', 'C-SPINES (OPEN MOUTH)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50021', 'CHEST (RT.LATERAL DECUBITUS)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50024', 'CHEST (PORTABLE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50027', 'CLAVICLE LT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50037', 'FOREARM BOTH (AP , LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50039', 'FOREARM LT. (AP , LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50042', 'HAND RT. (PA , OBLIQUE)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50045', 'HIP RT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50046', 'HIP LT. (AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50052', 'HUMERUS BOTH (AP,LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50409', 'NECK (SOFT TISSUE AP)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50381', 'HAND LT. (LAT)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50383', 'HIP LT. (LATERAL)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '50400', 'KNEE RT.(NOTCH VIEW)', 'XRAY', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '51001', 'BMD 1 PART', 'BMD', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '51002', 'BMD 2 PART', 'BMD', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '51004', 'BMD(Whole Body)', 'BMD', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52002', 'BARIUM ENEMA,SINGLE CM', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52003', 'BARIUM ENEMA,DOUBLE CM', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52004', 'BARIUM SWALLOW', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52005', 'CYSTOGRAM', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52006', 'ESOPHAGOGRAM', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52007', 'Endoscopic Retrograde Cholangio Pancreatography : ', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52008', 'FISTULOGRAPHY', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52009', 'H.S.G.', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52010', 'MYELOGRAM COMPLETE T-SPINES', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52011', 'MYELOGRAM LUMBAR SPINES', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52012', 'RETROGRADE PYELOGRAM', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52014', 'SIALOGRAPHY', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52015', 'TRANSHEPATIC CHOLANGGIOGRAPHY', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52016', 'T.TUBE CHOLANGGIOGRAPHY', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52017', 'INTRAOPERATIVE CHOLANGIOGRAPHY', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52018', 'UGI', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52019', 'UGI WITH SMALL BOWEL SERIES', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52020', 'URETHROGRAM', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52021', 'V.C.U.G.(42603)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52022', 'VENOGRAM RT.', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52023', 'VENOGRAM LT.', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52024', 'MYELOGRAM C-SPINE', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52029', 'ANTEGRADE PYELOGRAM', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52026', 'SCANOGRAM BOTH LEGS', 'FLUORO', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52027', 'SCANOGRAM WHOLE SPINES AP', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52025', 'SCANOGRAM RT.LEG', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52001', 'ARTHROGRAPHY', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52028', 'SCANOGRAM WHOLE SPIENS LATERAL', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '52013', 'SCANOGRAM LT.LEG', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53005', 'RT.LOWER EXTREMITY ANGIOGRAM', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53006', 'Revise  &  Change  Drainage(72941)  ', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53009', 'Biopsy under CT. guide (43911)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53010', 'EMBOLIZATION ', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53011', 'PCD', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53012', 'PCN', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53014', 'PTC', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53015', 'RF ABRATION', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53017', 'Transarterial Oily Chemo-Embolization:TOCE(42513)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53002', 'LT.UPPER EXTREMITY ANGIOGRAM', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53018', 'Fluoroscopic (72940)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53020', 'MARKED LOCALIZED', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53022', 'Percutanoues Drainage :P.C.D. (72941)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53042', 'Transjugular Liver Biopsy', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53023', 'Revise Drainage(72940)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53047', 'Right Percutanoues Catheter Nephostomy : Rt.PCN (7', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53052', 'RIGHT SUBCLAVIAN VENOGRAM (72942)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53032', 'LT. LOWER EXTREMITY ANGIOGRAM', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53031', 'RT. LOWER EXTREMITY ANGIOGRAM', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53028', 'Radiofrequency Ablation : RFA(43911)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53033', 'U/S survey for IVR. (43004)', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53025', 'Cerebral Angiogram', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53008', 'BALLOON DILATION', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53035', 'PERM  CATH.(42514)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53037', 'INFERIOR MESENTERIC ANGIOGRAM', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53038', 'SUPERIOR MESENTERIC ANGIOGRAM', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53030', 'Splenoportogaphy', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53039', 'VISERAL ANGIOGRAM', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53040', 'Percutanoues Ethanol:PEI.(43911)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53041', 'Brachial Angiogram', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53026', 'Percutanoues Nephrostomy : P.C.N.(72610)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53024', 'Percutanoues Drainage P.C.D. (single step)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53029', 'PTBD. with stent (72611)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53021', 'Fine Needle Aspiration FNA.(43910)', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53036', 'BRONCHIAL  ANGIOGRAM', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53044', 'U/S  guide for  biopsy.(43911)', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53049', 'U/S Portable(43001)', 'US', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53013', 'PTBD.(72610)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53034', 'Peripherally Inserted Central Catheter : PICC Line', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53003', 'RT.UPPER EXTREMITY ANGIOGRAM (42513)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53050', 'METALLIC STENT PLACEMENT (72942)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53053', 'VENOGRAPHY,Selective (72942)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53027', 'CHECKING FOR P.C.D.', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53046', 'HEPATIC EMBOLIZATION เธเธเธช. (42513)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53048', 'Left Percutanoues Catheter Nephostomy : Lt.PCN (72', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53051', 'LEFT SUBCLAVIAN VENOGRAM (72942)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '53054', 'VENOPLASTY (72942)', 'FLUORO', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '54001', 'I.V.P.(42601)', 'XRAY', '0', 0, 0, NULL, NULL, '', '', 0),
('THAIRIS', '6001', 'MAMMOGRAM WITH U/S', 'MAMMO', '0', 0, 0, NULL, NULL, '1', '', 0),
('THAIRIS', '6002', 'MAMMOGRAM', 'MAMMO', '0', 0, 0, NULL, NULL, '1', '', 0),
('THAIRIS', '53019', 'Angiogram Selective(42513) ', 'FLUORO', 'OTHER', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50411', 'ค่าพิมพ์ภาพลงฟิล์ม x 1 แผ่น', 'OT', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50412', 'ค่าพิมพ์ภาพลงฟิล์ม x 2 แผ่น', 'OT', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50413', 'ค่าพิมพ์ภาพลงฟิล์ม x 3 แผ่น', 'OT', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50414', 'ค่าพิมพ์ภาพลงฟิล์ม x 4 แผ่น', 'OT', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50415', 'ค่าพิมพ์ภาพลงฟิล์ม x 5 แผ่น', 'OT', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '20154', 'MRI FOOT LT', 'MRI', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '20159', 'MRI LT TM JOINT', 'MRI', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '20158', 'MRI RT TM JOINT', 'MRI', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50417', 'WRIST LT. (PA)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '40038', 'TRANSCRANIAL DOPPLER ULTRASOUND', 'US', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50418', 'WRIST RT. (PA)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50420', 'ANKLE RT. (AP,LAT,MORTISE)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50421', 'ANKLE LT. (AP,LAT,MORTISE)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50422', 'ค่าพิมพ์ภาพลงซีดี x 1 แผ่น', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50419', 'ANKLE BOTH (AP,LAT,MORTISE)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50424', 'HARRIS-BEATH VIEW.RT', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '20153', 'MRI FOOT RT', 'MR', 'LOWER EXTREMITY', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50426', 'MANDIBLE (AP,LATERAL)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50427', 'MANDIBLE (LATERAL)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50428', 'SHOULDER RT. (ZANCA VIEW)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50429', 'SHOULDER LT. (ZANCA VIEW)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '51005', 'BMD 3 PART', 'BMD', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50430', 'WRIST LT. (LAT)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '20160', 'MRI LT.FEMUR', 'MR', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50416', 'SACRUM (LAT)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '20155', 'MRI.LT FEMUR', 'MR', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '51006', 'BMD and VFA', 'BMD', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50438', 'HAND BOTH (AP)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50440', 'LEG BOTH (AP)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50442', 'LEG LT. (AP)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50439', 'HAND BOTH (AP,OBLIQUE)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '20156', 'MRA SUBCLAVIAN', 'MR', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '53001', 'Both PCN.(72943)', 'XA', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50433', 'MANDIBLE (RT.OBLIQUE)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50431', 'WRIST RT. (LAT)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50445', 'LEG RT. (LAT)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50435', 'MANDIBLE (AP, BOTH OBLIQUE)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50447', 'CLAVICLE BOTH (ZANCA VIEW)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50446', 'SKULL PA', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50448', 'THUMB BOTH (PA,LATERAL)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50451', 'HUMERUS BOTH (AP)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50450', 'THUMB LT. (PA,LATERAL)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50449', 'THUMB RT. (PA,LATERAL)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50434', 'MANDIBLE (LT.OBLIQUE)', 'XRAY', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50441', 'LEG BOTH (LAT)', 'CR', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50436', 'MANDIBLE (AP, RT.OBLIQUE)', 'CR', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50444', 'LEG RT. (AP)', 'CR', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '53055', 'Fluoroscopic Observation', 'RF', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50443', 'LEG LT. (LAT)', 'CR', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '50453', 'SHOULDER RT.(Velpeau View)', 'CR', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '5024', '', 'CR', '', 0, 0, NULL, NULL, '0', '', 0),
('THAIRIS', '1011', 'CT PLAIN K.U.B.', 'CT', '', 0, 0, NULL, NULL, '0', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `xray_country`
--

CREATE TABLE `xray_country` (
  `COUNTRY_CODE` varchar(20) NOT NULL,
  `COUNTRY_NAME` varchar(50) NOT NULL,
  `COUNTRY_NAME_ENG` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_department`
--

CREATE TABLE `xray_department` (
  `CENTER` varchar(10) NOT NULL,
  `DEPARTMENT_ID` varchar(10) NOT NULL,
  `NAME_THAI` varchar(50) NOT NULL,
  `NAME_ENG` varchar(50) NOT NULL,
  `TYPE` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_department`
--

INSERT INTO `xray_department` (`CENTER`, `DEPARTMENT_ID`, `NAME_THAI`, `NAME_ENG`, `TYPE`) VALUES
('THAIRIS', '001', 'None', 'None', 'O'),
('THAIRIS', '002', 'Test Department', 'Test Department', 'O');

-- --------------------------------------------------------

--
-- Table structure for table `xray_digi_form_mammo`
--

CREATE TABLE `xray_digi_form_mammo` (
  `ID` int(10) NOT NULL,
  `ACCESSION` int(30) NOT NULL,
  `EVER` varchar(1) NOT NULL,
  `FAMILY_MOM` varchar(1) NOT NULL,
  `FAMILY_SIS` varchar(1) NOT NULL,
  `FAMILY__AUN` varchar(1) NOT NULL,
  `FAMILY_GRAN_MOM` varchar(1) NOT NULL,
  `FAMILY_DAUG` varchar(1) NOT NULL,
  `FAMILY_COU` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xray_film_folder`
--

CREATE TABLE `xray_film_folder` (
  `ID` tinyint(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_icd`
--

CREATE TABLE `xray_icd` (
  `CODE` varchar(20) NOT NULL,
  `DESCRIPTION` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_image_status`
--

CREATE TABLE `xray_image_status` (
  `HN` varchar(10) NOT NULL,
  `XN` varchar(10) NOT NULL,
  `DEPARTMENT_ID` varchar(10) NOT NULL,
  `MOVE_BY` varchar(50) NOT NULL,
  `DATE` date NOT NULL,
  `TYPE_STATUS` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_log`
--

CREATE TABLE `xray_log` (
  `ID` int(11) NOT NULL,
  `USER` varchar(20) NOT NULL,
  `TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IP` varchar(30) NOT NULL,
  `URL` varchar(100) NOT NULL,
  `EVENT` varchar(20) NOT NULL,
  `MRN` varchar(20) NOT NULL,
  `ACCESSION` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_log`
--

INSERT INTO `xray_log` (`ID`, `USER`, `TIME`, `IP`, `URL`, `EVENT`, `MRN`, `ACCESSION`) VALUES
(1, 'doctor', '2017-01-15 14:17:39', '::1', 'http://localhost/thairis/index.html', 'LOGIN', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `xray_modalities`
--

CREATE TABLE `xray_modalities` (
  `MOD_NAME` varchar(20) NOT NULL,
  `MOD_TYPE` varchar(20) NOT NULL,
  `MOD_DESCRIPTION` varchar(50) NOT NULL,
  `AE_TITLE` varchar(50) NOT NULL,
  `IP_ADDRESS` varchar(50) NOT NULL,
  `PORT` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_modalities_type`
--

CREATE TABLE `xray_modalities_type` (
  `MOD_TYPE` varchar(20) NOT NULL,
  `MOD_DESCRIPTION` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_mwl`
--

CREATE TABLE `xray_mwl` (
  `IP` varchar(20) NOT NULL,
  `AE` varchar(50) NOT NULL,
  `PORT` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_name_prefix`
--

CREATE TABLE `xray_name_prefix` (
  `ID` varchar(5) NOT NULL,
  `THAI` varchar(50) NOT NULL,
  `ENG` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_news`
--

CREATE TABLE `xray_news` (
  `ID` int(11) NOT NULL,
  `CENTER_CODE` varchar(20) NOT NULL,
  `NEWS` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_news`
--

INSERT INTO `xray_news` (`ID`, `CENTER_CODE`, `NEWS`) VALUES
(1, 'THAIRIS', '                     <p><span style="FONT-WEIGHT: bold; TEXT-DECORATION: underline"><font color="#1015ff">NEWS</font></span><br><br></p><p>ThaiRIS Demo testing.</p><p><br></p><p><br></p><p><br></p><p style="text-align: center;">This demo for testing only..</p>'),
(2, 'POLICE', '                                                                                                                                                               <div><div><u><b>NEWS</b></u></div><div><br></div><div>Radiology Department</div></div><div>Here is testing for RIS.</div><div><br><br><br><br><br><br><br><div style="text-align: center;">This demo propose for tesing only.</div></div>');

-- --------------------------------------------------------

--
-- Table structure for table `xray_note`
--

CREATE TABLE `xray_note` (
  `ID` int(2) NOT NULL,
  `TYPE` varchar(20) COLLATE utf8_bin NOT NULL,
  `NAME` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `xray_order_cart`
--

CREATE TABLE `xray_order_cart` (
  `ID` int(10) NOT NULL,
  `SESSION_ID` varchar(50) NOT NULL,
  `MRN` varchar(10) NOT NULL,
  `XRAY_CODE` varchar(10) NOT NULL,
  `DATE` date NOT NULL,
  `REFERRER_ID` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_patient_info`
--

CREATE TABLE `xray_patient_info` (
  `ID` int(10) NOT NULL,
  `CENTER_CODE` varchar(10) CHARACTER SET tis620 NOT NULL,
  `MRN` varchar(10) CHARACTER SET tis620 NOT NULL,
  `XN` varchar(10) CHARACTER SET tis620 DEFAULT NULL,
  `SSN` varchar(13) CHARACTER SET tis620 DEFAULT NULL,
  `PREFIX` varchar(50) CHARACTER SET tis620 DEFAULT NULL,
  `NAME` varchar(120) CHARACTER SET tis620 NOT NULL,
  `LASTNAME` varchar(120) CHARACTER SET tis620 NOT NULL,
  `NAME_ENG` varchar(120) CHARACTER SET tis620 DEFAULT NULL,
  `LASTNAME_ENG` varchar(120) CHARACTER SET tis620 DEFAULT NULL,
  `NAME_OLD` varchar(50) CHARACTER SET tis620 DEFAULT NULL,
  `LASTNAME_OLD` varchar(50) CHARACTER SET tis620 DEFAULT NULL,
  `SEX` varchar(10) CHARACTER SET tis620 DEFAULT NULL,
  `BIRTH_DATE` date DEFAULT NULL,
  `TELEPHONE` varchar(15) CHARACTER SET tis620 DEFAULT NULL,
  `EMAIL` varchar(50) CHARACTER SET tis620 DEFAULT NULL,
  `NOTE` varchar(2000) CHARACTER SET tis620 DEFAULT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FIRSTVISITDATE` date DEFAULT NULL,
  `LASTVISITDATE` date DEFAULT NULL,
  `RIGHT_CODE` varchar(10) CHARACTER SET tis620 DEFAULT NULL,
  `ADDRESS` varchar(500) CHARACTER SET tis620 DEFAULT NULL,
  `VILLAGE` varchar(50) CHARACTER SET tis620 DEFAULT NULL,
  `ROAD` varchar(50) CHARACTER SET tis620 DEFAULT NULL,
  `TAMBON_CODE` varchar(50) CHARACTER SET tis620 DEFAULT NULL,
  `AMPHOE_CODE` varchar(50) CHARACTER SET tis620 DEFAULT NULL,
  `PROVINCE_CODE` varchar(20) CHARACTER SET tis620 DEFAULT NULL,
  `COUNTRY_CODE` varchar(50) CHARACTER SET tis620 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620 COLLATE=tis620_bin ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `xray_patient_info`
--

INSERT INTO `xray_patient_info` (`ID`, `CENTER_CODE`, `MRN`, `XN`, `SSN`, `PREFIX`, `NAME`, `LASTNAME`, `NAME_ENG`, `LASTNAME_ENG`, `NAME_OLD`, `LASTNAME_OLD`, `SEX`, `BIRTH_DATE`, `TELEPHONE`, `EMAIL`, `NOTE`, `CREATE_DATE`, `FIRSTVISITDATE`, `LASTVISITDATE`, `RIGHT_CODE`, `ADDRESS`, `VILLAGE`, `ROAD`, `TAMBON_CODE`, `AMPHOE_CODE`, `PROVINCE_CODE`, `COUNTRY_CODE`) VALUES
(1, 'THAIRIS', 'T001', 'T001', NULL, NULL, 'ThaiRIS', 'Demo', '', '', NULL, NULL, 'M', '2017-01-03', '', '', NULL, '2017-01-15 14:19:25', NULL, NULL, NULL, '', NULL, '', '', '', '', 'Thailand');

-- --------------------------------------------------------

--
-- Table structure for table `xray_patient_right`
--

CREATE TABLE `xray_patient_right` (
  `RIGHT_CODE` varchar(10) NOT NULL,
  `RIGHT_NAME` varchar(50) NOT NULL,
  `DISCOUNT` int(3) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_preparation`
--

CREATE TABLE `xray_preparation` (
  `PREP_ID` int(10) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `MODALITY` varchar(20) NOT NULL,
  `BODY_PART` varchar(20) NOT NULL,
  `DESCRIPTION_THAI` varchar(5000) NOT NULL,
  `DESCRIPTION_ENG` varchar(5000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_printer`
--

CREATE TABLE `xray_printer` (
  `LOCATION` varchar(20) NOT NULL,
  `IP` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_province`
--

CREATE TABLE `xray_province` (
  `PROVINCE_CODE` varchar(20) NOT NULL,
  `PROVINCE_NAME` varchar(50) NOT NULL,
  `PROVINCE_NAME_ENG` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_referrer`
--

CREATE TABLE `xray_referrer` (
  `ID` int(11) NOT NULL,
  `REFERRER_ID` varchar(10) NOT NULL,
  `DEGREE` varchar(5) NOT NULL DEFAULT 'MD',
  `NAME` varchar(50) DEFAULT NULL,
  `LASTNAME` varchar(50) DEFAULT NULL,
  `NAME_ENG` varchar(50) DEFAULT NULL,
  `LASTNAME_ENG` varchar(50) DEFAULT NULL,
  `PREFIX` varchar(3) DEFAULT NULL,
  `SEX` varchar(5) DEFAULT NULL,
  `CENTER_CODE` varchar(10) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `FAX` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_referrer`
--

INSERT INTO `xray_referrer` (`ID`, `REFERRER_ID`, `DEGREE`, `NAME`, `LASTNAME`, `NAME_ENG`, `LASTNAME_ENG`, `PREFIX`, `SEX`, `CENTER_CODE`, `EMAIL`, `FAX`) VALUES
(404, 'T001', 'MD', 'Dortest', 'Referrer', NULL, NULL, NULL, NULL, 'THAIRIS', 'mail@mail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `xray_report`
--

CREATE TABLE `xray_report` (
  `ID` int(20) NOT NULL,
  `ACCESSION` varchar(30) DEFAULT NULL,
  `REPORT` varchar(15000) DEFAULT NULL,
  `BIRAD` varchar(1) DEFAULT NULL,
  `HISTORY` varchar(5000) DEFAULT NULL,
  `CALCIUM` varchar(5000) DEFAULT NULL,
  `CORONARY` varchar(5000) DEFAULT NULL,
  `KEY_IMAGE_LINK` varchar(5000) DEFAULT NULL,
  `DICTATE_BY` varchar(10) DEFAULT NULL,
  `DICTATE_DATE` date DEFAULT NULL,
  `DICTATE_TIME` time DEFAULT NULL,
  `APPROVE_BY` varchar(10) DEFAULT NULL,
  `APPROVE_DATE` date DEFAULT NULL,
  `APPROVE_TIME` time DEFAULT NULL,
  `STATUS` varchar(20) DEFAULT NULL,
  `CENTER_CODE` varchar(20) DEFAULT NULL,
  `REFERRER_ID` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_report_structure`
--

CREATE TABLE `xray_report_structure` (
  `ID` int(10) NOT NULL,
  `MODALITY_TYPE` varchar(10) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `GROUP` varchar(20) NOT NULL,
  `DETAIL` varchar(2000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_report_structure`
--

INSERT INTO `xray_report_structure` (`ID`, `MODALITY_TYPE`, `NAME`, `TYPE`, `GROUP`, `DETAIL`) VALUES
(1, 'CT', 'CALCIUM-SCORE', 'text_html', '', '<b>A coronary artery calcium scoring examination was performed on a multi-slice computed tomography scanner (Brilliance 64, Philips Medical Systems). The data was used to detect and quantify the presence of calcified plaque in the coronary arteries.</b> <table width="100%" border="1" cellpadding="0" cellspacing="0">   <tr>     <td colspan="4">Key scan parameters : </td>   </tr>   <tr>     <td width="15%" align="right">kVp:</td>     <td width="20%">&nbsp;</td>     <td width="45%" align="right">Slice Thickness(mm):</td>     <td width="20%">&nbsp;</td>   </tr>   <tr>     <td width="15%" align="right">mAs:</td>     <td width="20%">&nbsp;</td>     <td width="45%" align="right">Rotation Time (s):</td>     <td width="20%">&nbsp;</td>   </tr>   <tr>     <td width="15%" align="right">Gating:</td>     <td width="20%">&nbsp;</td>     <td width="45%" align="right">&nbsp;</td>     <td width="20%">&nbsp;</td>   </tr> </table>'),
(2, 'CT', 'CORONARY-SCORING', 'text_html', '', '<table width="100%" border="0" cellpadding="0" cellspacing="0">   <tr>     <td colspan="2"><em>The patient has a total Calcium Score of:</em></td>     <td width="32%" rowspan="5"><img src=image/bkk/bkk-heart.jpg /></td>   </tr>   <tr>     <td width="23%" align="right"><em>Protocol Name:</em></td>     <td width="45%" align="left">&nbsp;</td>   </tr>   <tr>     <td align="right"><em>Weighting:</em></td>     <td align="left">&nbsp;</td>   </tr>   <tr>     <td align="right"><em>Threshold:</em></td>     <td align="left">&nbsp;</td>   </tr>   <tr>     <td align="right"><em>Density Mode:</em></td>     <td align="left">&nbsp;</td>   </tr> </table><br />'),
(3, 'CT', 'Chest pain', 'checkbox', 'risk', ''),
(4, 'CT', 'Dyspnea', 'checkbox', 'risk', ''),
(5, 'CT', 'Palpitation', 'checkbox', 'risk', ''),
(6, 'CT', 'Smoking', 'checkbox', 'risk', ''),
(7, 'CT', 'Abnormal ECG', 'checkbox', 'risk', ''),
(8, 'CT', 'Abnormal wall motion', 'checkbox', 'risk', ''),
(9, 'CT', 'Positive EST', 'checkbox', 'risk', ''),
(10, 'CT', 'Family history of CA', 'checkbox', 'risk', ''),
(11, 'CT', 'Hypertension', 'checkbox', 'risk', ''),
(12, 'CT', 'Diabetes Mellitus', 'checkbox', 'risk', ''),
(13, 'CT', 'Hypercholesterolemia', 'checkbox', 'risk', ''),
(14, 'CT', 'Peripheral arterial disease', 'checkbox', 'risk', ''),
(15, 'CT', 'Previous stroke', 'checkbox', 'risk', ''),
(16, 'CT', 'Previous MI', 'checkbox', 'risk', ''),
(17, 'CT', 'Previous CABG', 'checkbox', 'risk', ''),
(18, 'CT', 'Previous PCI', 'checkbox', 'risk', '');

-- --------------------------------------------------------

--
-- Table structure for table `xray_report_template`
--

CREATE TABLE `xray_report_template` (
  `ID` int(5) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `XRAY_CODE` varchar(50) NOT NULL,
  `XRAY_TYPE_CODE` varchar(10) NOT NULL,
  `BODY_PART` varchar(15) NOT NULL,
  `USER_ID` varchar(20) NOT NULL,
  `REPORT_DETAIL` varchar(10000) NOT NULL,
  `ALL_USER` varchar(1) NOT NULL DEFAULT '0',
  `TIME_CREATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_request`
--

CREATE TABLE `xray_request` (
  `ID` int(11) NOT NULL,
  `REQUEST_NO` varchar(30) NOT NULL,
  `XN` varchar(10) DEFAULT NULL,
  `MRN` varchar(10) NOT NULL,
  `REFERRER` varchar(20) DEFAULT NULL,
  `REQUEST_DATE` date NOT NULL,
  `REQUEST_TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DEPARTMENT_ID` varchar(10) DEFAULT NULL,
  `PORTABLE` int(1) UNSIGNED DEFAULT NULL,
  `USER` varchar(10) DEFAULT NULL,
  `CANCEL_STATUS` int(1) UNSIGNED NOT NULL DEFAULT '0',
  `USER_ID_CANCLE` varchar(10) DEFAULT NULL,
  `CANCEL_DATE` date DEFAULT NULL,
  `CANCEL_TIME` time DEFAULT NULL,
  `STATUS` varchar(10) NOT NULL DEFAULT '1',
  `ICON` varchar(50) DEFAULT NULL,
  `NOTE` varchar(500) DEFAULT NULL,
  `CENTER_CODE` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_request_detail`
--

CREATE TABLE `xray_request_detail` (
  `ID` int(10) NOT NULL,
  `REQUEST_NO` varchar(30) NOT NULL,
  `ACCESSION` varchar(30) NOT NULL,
  `XRAY_CODE` varchar(10) NOT NULL,
  `CHARGED` int(1) DEFAULT NULL,
  `REQUEST_TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `REQUEST_TIME` time NOT NULL DEFAULT '00:00:00',
  `REQUEST_DATE` date DEFAULT NULL,
  `SCHEDULE_DATE` date DEFAULT NULL,
  `SCHEDULE_TIME` time DEFAULT NULL,
  `REPORT_TIME` time DEFAULT NULL,
  `REPORT_DATE` date DEFAULT NULL,
  `REPORT_STATUS` varchar(1) DEFAULT '0',
  `CANCEL_STATUS` varchar(1) DEFAULT '0',
  `USER_ID_CANCEL` varchar(10) DEFAULT NULL,
  `ARRIVAL_TIME` timestamp NULL DEFAULT NULL,
  `READY_TIME` timestamp NULL DEFAULT NULL,
  `START_TIME` timestamp NULL DEFAULT NULL,
  `COMPLETE_TIME` timestamp NULL DEFAULT NULL,
  `ASSIGN_TIME` timestamp NULL DEFAULT NULL,
  `APPROVED_TIME` timestamp NULL DEFAULT NULL,
  `ASSIGN` varchar(20) DEFAULT NULL,
  `ASSIGN_BY` varchar(20) DEFAULT NULL,
  `STATUS` varchar(10) NOT NULL DEFAULT 'NEW',
  `PAGE` varchar(15) NOT NULL DEFAULT 'ORDER LIST',
  `LOCKBY` varchar(15) DEFAULT NULL,
  `URGENT` varchar(1) NOT NULL DEFAULT '0',
  `LASTREPORT_ID` varchar(20) DEFAULT NULL,
  `TEMP_REPORT` varchar(15000) DEFAULT NULL,
  `AUTO_SAVE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TECH1` varchar(5) DEFAULT NULL,
  `TECH2` varchar(5) DEFAULT NULL,
  `TECH3` varchar(5) DEFAULT NULL,
  `FLAG1` int(1) DEFAULT NULL,
  `FLAG2` int(1) DEFAULT NULL,
  `FLAG3` int(1) DEFAULT NULL,
  `REPORT_BOOK` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_room`
--

CREATE TABLE `xray_room` (
  `ID` int(11) NOT NULL,
  `CENTER` varchar(10) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `DESCRIPTION` varchar(20) NOT NULL,
  `TYPE` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_room`
--

INSERT INTO `xray_room` (`ID`, `CENTER`, `NAME`, `DESCRIPTION`, `TYPE`) VALUES
(0, 'THAIRIS', 'US1', 'Ultrasound Room1', 'US'),
(0, 'THAIRIS', 'US2', 'Ultrasound Room2', 'US'),
(0, 'THAIRIS', 'CT', 'CT ROOM', 'CT'),
(0, 'THAIRIS', 'GEN1', 'General Xray Room1', 'XRAY'),
(0, 'THAIRIS', 'GEN2', 'General Xray Room2', 'XRAY'),
(0, 'THAIRIS', 'PORT1', 'Portable', 'XRAY'),
(0, 'THAIRIS', 'FLU1', 'Flu Room1', 'SPECIAL');

-- --------------------------------------------------------

--
-- Table structure for table `xray_sc_calendar`
--

CREATE TABLE `xray_sc_calendar` (
  `calendar_id` int(11) NOT NULL,
  `calendar_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xray_sc_calendar`
--

INSERT INTO `xray_sc_calendar` (`calendar_id`, `calendar_name`) VALUES
(1, 'Unbook'),
(2, 'XRAY'),
(3, 'CT'),
(4, 'MRI'),
(5, 'US'),
(6, 'MAMMO');

-- --------------------------------------------------------

--
-- Table structure for table `xray_sc_events`
--

CREATE TABLE `xray_sc_events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(100) DEFAULT NULL,
  `event_description` varchar(200) DEFAULT NULL,
  `MRN` varchar(30) NOT NULL,
  `ACCESSION` varchar(30) NOT NULL,
  `calendar_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `all_day` smallint(6) DEFAULT '0',
  `repeat_mode` varchar(11) DEFAULT NULL,
  `repeat_count` int(11) DEFAULT NULL,
  `day_only_weekdays` int(11) DEFAULT NULL,
  `week_days` varchar(20) DEFAULT NULL COMMENT 'comma number of days',
  `month_weeknumber` int(11) DEFAULT NULL,
  `month_weekday` int(11) DEFAULT NULL,
  `month_repeatdate` datetime DEFAULT NULL,
  `event_type` varchar(20) DEFAULT NULL,
  `rel_event_id` int(11) DEFAULT NULL,
  `repeat_end_date` datetime DEFAULT NULL,
  `event_delete_ind` int(11) DEFAULT NULL,
  `recur_sequence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xray_status`
--

CREATE TABLE `xray_status` (
  `ID` int(11) NOT NULL,
  `CODE` varchar(10) NOT NULL,
  `NAME` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_status`
--

INSERT INTO `xray_status` (`ID`, `CODE`, `NAME`) VALUES
(1, 'NEW', 'NEW'),
(2, 'ARRIVAL', 'ARRIVAL'),
(3, 'SCHEDULE', 'SCHEDULE'),
(4, 'WAIT', 'WAIT'),
(5, 'ENDEXAM', 'ENDEXAM'),
(6, 'ASSIGN', 'ASSIGN'),
(7, 'COMPLETE', 'COMPLETE'),
(8, 'STARTEXAM', 'STARTEXAM'),
(9, 'CANCEL', 'CANCEL');

-- --------------------------------------------------------

--
-- Table structure for table `xray_stock`
--

CREATE TABLE `xray_stock` (
  `ID` int(6) NOT NULL,
  `STOCK_CODE` varchar(10) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `TYPE` varchar(50) NOT NULL,
  `AMOUNT` int(3) UNSIGNED NOT NULL,
  `PRICE` int(7) NOT NULL,
  `UNIT` varchar(20) NOT NULL,
  `ACTIVE` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_stock_type`
--

CREATE TABLE `xray_stock_type` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_stock_type`
--

INSERT INTO `xray_stock_type` (`ID`, `NAME`) VALUES
(1, 'CONTRAST'),
(2, 'FILM'),
(3, 'MEDICINES'),
(4, 'MISCELLANEOUS');

-- --------------------------------------------------------

--
-- Table structure for table `xray_tambon`
--

CREATE TABLE `xray_tambon` (
  `TAMBON_CODE` varchar(20) NOT NULL,
  `TAMBON_NAME` varchar(50) NOT NULL,
  `TAMBON_NAME_ENG` varchar(50) NOT NULL,
  `AMPHOE_CODE` varchar(20) NOT NULL,
  `POST_CODE` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_teaching_cases`
--

CREATE TABLE `xray_teaching_cases` (
  `ID` int(11) NOT NULL,
  `SECTION_ID` varchar(20) NOT NULL,
  `MRN` varchar(10) NOT NULL,
  `ACCESSION` varchar(16) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `USER_GROUP` varchar(10) NOT NULL,
  `USER_ALL` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_teaching_cat`
--

CREATE TABLE `xray_teaching_cat` (
  `ID` int(5) NOT NULL,
  `SECTION` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_teaching_cat`
--

INSERT INTO `xray_teaching_cat` (`ID`, `SECTION`) VALUES
(1, 'Abdominal Imaging'),
(2, 'Breast Imaging'),
(3, 'Cardiovascular'),
(4, 'Chest Imaging'),
(5, 'Genital (Female) Imaging'),
(6, 'Head & Neck Imaging'),
(7, 'Interventional Radio'),
(8, 'Musculoskeletal System'),
(9, 'Neuroradiology'),
(10, 'Paediatric Radiology'),
(11, 'Uroradiology & Genital Male Imaging');

-- --------------------------------------------------------

--
-- Table structure for table `xray_type`
--

CREATE TABLE `xray_type` (
  `XRAY_TYPE_CODE` varchar(10) NOT NULL,
  `TYPE_NAME` varchar(50) NOT NULL,
  `TYPE_NAME_ENG` varchar(50) NOT NULL,
  `MOD_TYPE` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_type`
--

INSERT INTO `xray_type` (`XRAY_TYPE_CODE`, `TYPE_NAME`, `TYPE_NAME_ENG`, `MOD_TYPE`) VALUES
('ANGIO', 'Angio', 'Angiography', 'ANGIO\r'),
('BMD', 'Bone Mineral Densitometry', 'Bone Mineral Densitometry', 'BMD'),
('CT', 'Computed Tomography', 'Computed Tomography', 'CT'),
('FLUORO', 'Xray Special', 'Xray Special', 'FLUORO'),
('MAMMO', 'Mammography', 'Mammography', 'MG'),
('MRI', 'Magnetic Resonance Imaging', 'Magnetic Resonance Imaging', 'MRI'),
('US', 'Ultrasound', 'Ultrasound', 'US'),
('XRAY', 'General Xray', 'General Xray', 'XRAY');

-- --------------------------------------------------------

--
-- Table structure for table `xray_usage`
--

CREATE TABLE `xray_usage` (
  `ID` int(10) NOT NULL,
  `REQUEST_NO` varchar(10) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  `FILM_SIZE` varchar(10) NOT NULL,
  `FILM_QULITY` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_user`
--

CREATE TABLE `xray_user` (
  `ID` int(5) NOT NULL,
  `CODE` varchar(15) DEFAULT NULL,
  `DF_CODE` varchar(15) DEFAULT NULL,
  `LOGIN` varchar(20) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `LASTNAME` varchar(50) NOT NULL,
  `NAME_ENG` varchar(50) NOT NULL,
  `LASTNAME_ENG` varchar(50) NOT NULL,
  `USER_TYPE_CODE` varchar(20) NOT NULL,
  `PREFIX` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `CENTER_CODE` varchar(10) NOT NULL,
  `CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SESSION` varchar(100) NOT NULL,
  `ENABLE` varchar(1) NOT NULL DEFAULT '1',
  `ALL_CENTER` tinyint(1) NOT NULL DEFAULT '0',
  `LOGINTIME` time DEFAULT NULL,
  `TEXT_SIGNATURE` varchar(200) NOT NULL,
  `PACS_LOGIN` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_user`
--

INSERT INTO `xray_user` (`ID`, `CODE`, `DF_CODE`, `LOGIN`, `NAME`, `LASTNAME`, `NAME_ENG`, `LASTNAME_ENG`, `USER_TYPE_CODE`, `PREFIX`, `PASSWORD`, `CENTER_CODE`, `CREATED_TIME`, `SESSION`, `ENABLE`, `ALL_CENTER`, `LOGINTIME`, `TEXT_SIGNATURE`, `PACS_LOGIN`) VALUES
(1, 'test', 'test', 'admin', 'MR.Test', 'Radiology', 'TESTEnglishNAME', 'TESTEnglishLastname', 'ADMIN', NULL, '098f6bcd4621d373cade4e832627b4f6', 'THAIRIS', '2009-08-26 19:10:45', '', '1', 0, '10:32:09', '      <div>----------------------------------</div>   Dr.Test Radiologist (SPT)<div>----------------------------------</div>', 'swrp'),
(3, '0', '', '0', 'Not assign', '-', '0', '0', 'RADIOLOGIST', NULL, '0', 'THAIRIS', '2009-08-26 19:10:45', '208f4137246e345fad93c7a3362c2991', '1', 0, '00:00:00', '', NULL),
(5, 'doctor', '', 'doctor', 'doctor', 'doctor', 'doctor', 'Service', 'RADIOLOGIST', NULL, '098f6bcd4621d373cade4e832627b4f6', 'THAIRIS', '2013-09-04 15:23:25', 'j9jk75md60128e7t8o79bd72n0', '1', 0, '21:17:39', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xray_user_df_code`
--

CREATE TABLE `xray_user_df_code` (
  `ID` int(11) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `DF_CODE` varchar(20) NOT NULL,
  `NAME_THAI` varchar(50) NOT NULL,
  `NAME_ENG` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- --------------------------------------------------------

--
-- Table structure for table `xray_user_right`
--

CREATE TABLE `xray_user_right` (
  `USER_ID` int(3) NOT NULL,
  `SUPER_ADMIN` int(1) NOT NULL DEFAULT '0',
  `ADMIN` int(1) NOT NULL DEFAULT '0',
  `DELETE_ORDER` int(1) NOT NULL DEFAULT '0',
  `CHANGE_STATUS` int(1) NOT NULL DEFAULT '0',
  `EDIT_PATIENT` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_user_right`
--

INSERT INTO `xray_user_right` (`USER_ID`, `SUPER_ADMIN`, `ADMIN`, `DELETE_ORDER`, `CHANGE_STATUS`, `EDIT_PATIENT`) VALUES
(1, 1, 1, 1, 1, 1),
(3, 0, 0, 0, 0, 0),
(5, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xray_user_type`
--

CREATE TABLE `xray_user_type` (
  `CODE` varchar(10) NOT NULL,
  `TYPE` varchar(15) NOT NULL,
  `NAME` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `xray_user_type`
--

INSERT INTO `xray_user_type` (`CODE`, `TYPE`, `NAME`) VALUES
('1', 'ADMIN', 'ADMIN'),
('4', 'RADIOLOGIST', 'RADIOLOGIST'),
('3', 'CLINICIAN', 'CLINICIAN'),
('2', 'CLERK', 'CLERK'),
('5', 'TECHNICIAN', 'TECHNICIAN');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `xray_amphoe`
--
ALTER TABLE `xray_amphoe`
  ADD PRIMARY KEY (`AMPHOE_CODE`);

--
-- Indexes for table `xray_auto`
--
ALTER TABLE `xray_auto`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_billing`
--
ALTER TABLE `xray_billing`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_birad`
--
ALTER TABLE `xray_birad`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_center`
--
ALTER TABLE `xray_center`
  ADD PRIMARY KEY (`CODE`);

--
-- Indexes for table `xray_code`
--
ALTER TABLE `xray_code`
  ADD PRIMARY KEY (`XRAY_CODE`);

--
-- Indexes for table `xray_country`
--
ALTER TABLE `xray_country`
  ADD PRIMARY KEY (`COUNTRY_CODE`);

--
-- Indexes for table `xray_department`
--
ALTER TABLE `xray_department`
  ADD PRIMARY KEY (`DEPARTMENT_ID`);

--
-- Indexes for table `xray_film_folder`
--
ALTER TABLE `xray_film_folder`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_image_status`
--
ALTER TABLE `xray_image_status`
  ADD PRIMARY KEY (`HN`);

--
-- Indexes for table `xray_log`
--
ALTER TABLE `xray_log`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_modalities`
--
ALTER TABLE `xray_modalities`
  ADD PRIMARY KEY (`MOD_NAME`);

--
-- Indexes for table `xray_modalities_type`
--
ALTER TABLE `xray_modalities_type`
  ADD PRIMARY KEY (`MOD_TYPE`);

--
-- Indexes for table `xray_news`
--
ALTER TABLE `xray_news`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_order_cart`
--
ALTER TABLE `xray_order_cart`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_patient_info`
--
ALTER TABLE `xray_patient_info`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `MRN` (`MRN`);

--
-- Indexes for table `xray_patient_right`
--
ALTER TABLE `xray_patient_right`
  ADD PRIMARY KEY (`RIGHT_CODE`);

--
-- Indexes for table `xray_preparation`
--
ALTER TABLE `xray_preparation`
  ADD PRIMARY KEY (`PREP_ID`);

--
-- Indexes for table `xray_province`
--
ALTER TABLE `xray_province`
  ADD PRIMARY KEY (`PROVINCE_CODE`);

--
-- Indexes for table `xray_referrer`
--
ALTER TABLE `xray_referrer`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `REFERRER_ID` (`REFERRER_ID`);

--
-- Indexes for table `xray_report`
--
ALTER TABLE `xray_report`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_report_structure`
--
ALTER TABLE `xray_report_structure`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_report_template`
--
ALTER TABLE `xray_report_template`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_request`
--
ALTER TABLE `xray_request`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `REQUEST_NO` (`REQUEST_NO`);

--
-- Indexes for table `xray_request_detail`
--
ALTER TABLE `xray_request_detail`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ACCESSION` (`ACCESSION`);

--
-- Indexes for table `xray_sc_calendar`
--
ALTER TABLE `xray_sc_calendar`
  ADD PRIMARY KEY (`calendar_id`);

--
-- Indexes for table `xray_sc_events`
--
ALTER TABLE `xray_sc_events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `events_ibfk_1` (`calendar_id`);

--
-- Indexes for table `xray_status`
--
ALTER TABLE `xray_status`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_stock`
--
ALTER TABLE `xray_stock`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_tambon`
--
ALTER TABLE `xray_tambon`
  ADD PRIMARY KEY (`TAMBON_CODE`);

--
-- Indexes for table `xray_teaching_cases`
--
ALTER TABLE `xray_teaching_cases`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_teaching_cat`
--
ALTER TABLE `xray_teaching_cat`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_type`
--
ALTER TABLE `xray_type`
  ADD PRIMARY KEY (`XRAY_TYPE_CODE`);

--
-- Indexes for table `xray_usage`
--
ALTER TABLE `xray_usage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_user`
--
ALTER TABLE `xray_user`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_user_df_code`
--
ALTER TABLE `xray_user_df_code`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xray_user_right`
--
ALTER TABLE `xray_user_right`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `xray_auto`
--
ALTER TABLE `xray_auto`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `xray_billing`
--
ALTER TABLE `xray_billing`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xray_film_folder`
--
ALTER TABLE `xray_film_folder`
  MODIFY `ID` tinyint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xray_log`
--
ALTER TABLE `xray_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `xray_order_cart`
--
ALTER TABLE `xray_order_cart`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5145;
--
-- AUTO_INCREMENT for table `xray_patient_info`
--
ALTER TABLE `xray_patient_info`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `xray_preparation`
--
ALTER TABLE `xray_preparation`
  MODIFY `PREP_ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xray_referrer`
--
ALTER TABLE `xray_referrer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;
--
-- AUTO_INCREMENT for table `xray_report`
--
ALTER TABLE `xray_report`
  MODIFY `ID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114004;
--
-- AUTO_INCREMENT for table `xray_report_structure`
--
ALTER TABLE `xray_report_structure`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `xray_report_template`
--
ALTER TABLE `xray_report_template`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xray_request`
--
ALTER TABLE `xray_request`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xray_request_detail`
--
ALTER TABLE `xray_request_detail`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xray_sc_calendar`
--
ALTER TABLE `xray_sc_calendar`
  MODIFY `calendar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `xray_sc_events`
--
ALTER TABLE `xray_sc_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT for table `xray_status`
--
ALTER TABLE `xray_status`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `xray_stock`
--
ALTER TABLE `xray_stock`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xray_teaching_cases`
--
ALTER TABLE `xray_teaching_cases`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xray_teaching_cat`
--
ALTER TABLE `xray_teaching_cat`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `xray_usage`
--
ALTER TABLE `xray_usage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xray_user`
--
ALTER TABLE `xray_user`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `xray_user_df_code`
--
ALTER TABLE `xray_user_df_code`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xray_user_right`
--
ALTER TABLE `xray_user_right`
  MODIFY `USER_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `xray_sc_events`
--
ALTER TABLE `xray_sc_events`
  ADD CONSTRAINT `xray_sc_events_ibfk_1` FOREIGN KEY (`calendar_id`) REFERENCES `xray_sc_calendar` (`calendar_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

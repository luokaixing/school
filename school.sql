-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2020-04-26 05:05:16
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `school`
--

-- --------------------------------------------------------

--
-- 表的结构 `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `class_no` varchar(255) DEFAULT NULL,
  `class_teacher` varchar(255) DEFAULT NULL,
  `class_admin` varchar(255) DEFAULT NULL,
  `class_grade` varchar(255) DEFAULT NULL,
  `class_time` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `class`
--

INSERT INTO `class` (`class_id`, `class_no`, `class_teacher`, `class_admin`, `class_grade`, `class_time`) VALUES
(1, '2016_01', '张三', 'admin', '2016', '2020-04-23'),
(2, '2016_02', '李四', '罗开星', '2016', '2020-04-23'),
(3, '2016_03', '王五', 'luokaixing1', '2016', '2020-04-23'),
(4, '2016_04', '李逍遥', 'luokaixing123', '2016', '2020-04-23'),
(6, '2015_01', '张三', 'admin', '2015', '2020-04-23'),
(7, '2015_02', '李四', '罗开星', '2015', '2020-04-23'),
(8, '2015_03', '王五', 'luokaixing1', '2015', '2020-04-23'),
(9, '2015_04', '李逍遥', 'luokaixing123', '2015', '2020-04-23'),
(10, '2014_01', '张三', 'admin', '2014', '2020-04-23'),
(11, '2014_02', '李四', '罗开星', '2014', '2020-04-23'),
(12, '2014_03', '王五', 'luokaixing1', '2014', '2020-04-23'),
(13, '2014_04', '李逍遥', 'luokaixing123', '2014', '2020-04-23');

-- --------------------------------------------------------

--
-- 表的结构 `excellent`
--

CREATE TABLE `excellent` (
  `excellent_id` int(11) NOT NULL,
  `excellent_name` varchar(255) DEFAULT NULL,
  `excellent_desc` varchar(255) DEFAULT NULL,
  `excellent_pos` varchar(255) DEFAULT NULL,
  `excellent_url` varchar(255) DEFAULT NULL,
  `excellent_con` mediumtext CHARACTER SET utf8mb4,
  `excellent_time` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `excellent`
--

INSERT INTO `excellent` (`excellent_id`, `excellent_name`, `excellent_desc`, `excellent_pos`, `excellent_url`, `excellent_con`, `excellent_time`) VALUES
(1, '李飞', '1987年毕业于机电工程学院机械制造及自动化专业', '中共党员，高级工程师，湖南省第十二届人大代表，中国南车株洲电力机车有限公司董事长兼总经理。', '1', '\r\n 周清和学长常与人说起，自己人生的两大爱好便是足球和篮球，今天走进周清和学长的办公室，果不其然在最显眼的位置发现了它们。他说，在母校四十周年校庆时，他还带领南车株机的校友、南车株机的足球队，与机电学院的足球队踢了一场热热闹闹的友谊赛。在周清和学长看来，不管人生的轨迹如何行进，健康永远是摆在首位，这使得周清和学长即使离开了大学也从未见其消减对运动的热爱。\r\n\r\n聊起在交大的生活，除了绿茵场，周清和学长印象最为深刻的莫过于机械设计课程设计这门课。三十年前在交大，学长学姐和我们一样，在最冷或最热的季节，画着比桌面还大的图纸。多少个通宵熬夜，多少次易稿，周清和学长丝毫没有懈怠，“每当我想起这些的时候，我都庆幸我没有把时间浪费在吃喝玩乐上，而是踏踏实实放在自我升值中”。\r\n\r\n他们那个年代，没有餐馆、歌厅，没有随手打开的电视，甚至看场电影都并非易事。但是，只要有人，就会有欢乐。他们制造出了属于他们的娱乐。周清和学长回忆道，那时候的大学生活，校园里最为时髦、最受众人追捧的娱乐当属交谊舞。每当晚霞映照的时候，食堂前的平台，不论相识与否，翩翩起舞是增进感情最好的方式。对他们来说，这本是一种娱乐，但也正是这些娱乐，潜移默化地培养了他们这一群交大人的社交能力和人格素养。', '2020-04-20'),
(2, '赵广', '1985年毕业于机电工程学院机械设计制造及其自动化（机械制造工艺及设备）专业。', '1994年至1998年先后担任浦镇车辆厂团委副书记、团委书记主持团委工作', '1', '每个学生都会有这样的一天：离开母校，奔向人生的下一个驿站，开始漫长的职业生涯。从华东交通大学毕业后，忻群学姐来到了中国南车集团南京浦镇车辆有限公司参加工作。初出茅庐，她成了职工大学的一名讲师。在这个平凡的岗位上，一干就是七年，踏踏实实、兢兢业业地做着自己的本职工作，从未懈怠。“无论从事什么工作，只要你用心去做，你就能创造属于你自己的价值。” 忻群学姐说。\r\n\r\n功夫不负有心人，七年的坚持与努力，她取得了喜人的成绩。在一次职工大学《机械原理》的课程统考中，她所教的班级以平均分94的高分获全市第一。“是金子总会发光，有才能就不会被埋没。”出色的工作成绩以及踏实能干的优秀品质，使得忻群学姐得到了公司领导的认可。1993年8月她离开她站了七年的讲台，进入浦厂宣传部；1996年，她担任浦镇车辆厂团委书记，主持团委工作，成了浦镇公司成立以来第一位女团委书记。由于这个单位以前从未有过女书记，忻群学姐的上任不免让一些员工多有说辞。面对这些，忻群学姐并没有让公司失望，“任何工作都要学会放低姿态、实打实干，嘴要甜、要勤，多虚心请教，用工作成绩去回报别人的帮助”，在“没钱没权没资源”的团委岗位上，她用优秀的工作成绩证明了自己。此后，忻群学姐便开始走进管理层，走向公司的领导岗位。\r\n\r\n从讲师到公司高层领导，无论身居何职，无论从事什么工作，忻群学姐一直保持着她对工作的那份执着与坚持。我想，正是由于学姐的那份执着与坚持，她才能在如此多的人面前脱颖而出，创造属于自己的价值。\r\n\r\n如今提到忻群，南车浦镇公司的职工没有人不知道这位敬业乐群的副书记。近三十年的呕心沥血、勤苦工作，公司已经彻底成为了忻群学姐生活的一部分，同呼吸、共命运。一路走来，有辉煌也有坎坷，但无论是坦途还是岖径，只有一步一个脚印踏踏实实地走好每一步，才有可能走到理想的终点。正如忻群学姐说的：“不积跬步，无以至千里。”\r\n', '2020-04-20'),
(3, '罗维', '1986年毕业于土木建筑学院工业与民用建筑专业', '现任杭州联纵国际集团董事长兼总经理，高级工程师，国家一级注册结构工程师，华东交通大学浙江校友会会长，杭州结构与地基处理研究会、设计综合技术专业委员会副主任委员，建筑物灾害防治专业委员会委员，建筑结构专业委员会委员。', '1', '谈起母校，学长流露出对母校师恩的难忘和对同学情谊的珍惜。他感慨这些年母校发展很快，回想1982年以高分考入华东交通大学，学长说那时学校的条件还比较艰苦，现在已经有艺术、人文、经管、外语、国际等众多学院，学弟学妹现在的大学生活应该更幸福了。“那时的工民建专业只有两个班，而土木系也只有十几个班，全校新生一共才几百人，教学、住宿条件非常艰苦，但学生和老师特别勤奋，感情很深。”学长意味深长的回忆道。\r\n\r\n谈起老师，学长觉得那时候的老师在社会上、经济上的压力比现在小很多，教书育人的目的性更强。他们教学严格、认真，早自习、晚自修都会亲自督导，在学习、生活上处处给予关心，将每一位学生视为“人才”来培养。谈到这里，学长给我们讲了一个令他特别难忘的小故事：“一次我和同学去南昌市区观看武术比赛，结束返校时才发现公共汽车已停运，步行回去又太远，万分焦急下，我们打电话向一位家住市区的老师求助，老师虽与我们不熟，却好心收留我们在他家里过夜。”回忆到这里，学长眼神中充满了对恩师深深的感怀。\r\n\r\n谈到学习，学长认为，学好知识是学生最基本的要求，不仅要学好书本知识，还要掌握好学习方法，培养好习惯。优异的学习成绩可以给用人单位留下良好的印象，你的工作就可以有个良好的开端。作为联纵国际集团的董事长，学长告诉我们他们公司最青睐两种人：一种是专业知识过硬、学习成绩优秀的人；另一种是学生干部，做过学生工作的人综合素质相对较高、工作能力强、为人处世的能力较好，很多工作项目需要这样的人去牵头。\r\n\r\n谈到生活，学长的生活很有规律，他的午后是和同学一起打球、散步，晚上则看书、复习，这些使他自己养成了良好的习惯，和同学建立了深厚的友谊。学长说“一定要在大学里锻炼强健的身体，特别是我们建筑行业，经常连续加班到深夜，没有一个好身体做后盾就会心有余而力不足。”\r\n\r\n', '2020-04-20'),
(4, '将林', '1986年毕业于机电工程学院机械制造专业', '2001年攻读武汉大学商学院MBA，2010年就读西南交大商学院EMBA，现任中铁咨询机动院院长。', '1', '“我的个人经历非常简单，毕业28年，在中铁四院工作18年，在北京工作10年直到现在。”郑宝林学长用这一句话就概括了他走过的职场生涯，听起来简单，其实不然，郑宝林学长一点都“不简单”。\r\n\r\n中铁咨询机械动力设计研究院主要负责铁路综合项目的机务段、车辆段、动车组段等专业的设计以及各种工厂、城市轨道交通项目、铁路专用大型机械设备的产品研发、咨询、监理等业务。近三年来，郑宝林学长作为机动院院长，先后带领全院承揽并独立组织完成多个工程项目，昆明中铁大型养路机械集团有限公司国家大型铁路养护设备昆明产业基地、北车集团南口高速重载铁路道岔生产工厂、普阳钢厂输煤系统、锡林浩特机务段、济南西机务段设计；呼张高速铁路呼和东动车组运用所初步设计、张呼城际北京北动车组运用所初步设计、吉图珲客运专线珲春存车场施工图设计等。\r\n\r\n   “想要有大的发展，就不能太踏实，要有一颗不能满足的心，勇攀一个又一个高峰。”郑学长用行动践行着奋斗不止的铮铮誓言，凭借那股子“初生牛犊不怕虎”的闯劲，他在工作岗位上勤发现、勤思考、勤求变，多次获中铁咨询文明生产个人，优秀共产党员称号，铁道部部优秀设计奖；成为2000年院十大“跨世纪人才暨九五功臣”推荐唯一候选人，入选铁道部、武汉市专家库。此外，他还主持并完成了 “青藏铁路桥梁检测维修设备”（国家863科研）、“高速铁路轨行式桥梁检查车”（部科研）、“客运专线人行道走行式桥梁检查”（部科研）、“客运专线桥梁检测小车”（采用视觉检查技术）等设备的研制以及国家专利产品（专利号：ZL02200652.4）JDK型机务段道岔集中电气控制系统升级、改造工作等。在前行的路上，郑宝林学长创造着阳光，照亮了自己，也照亮了我们。\r\n', '2020-04-20'),
(5, '王历', '1988年毕业于土木建筑学院工业与民用建筑专业', '现担任东南沿海铁路福建有限责任公司董事长、总经理兼南昌铁路局副局长（正局级），高级工程师，十二届全国人大代表。历任上海铁路局福州分局福州建筑段段长，分局副总经济师，南昌铁路局副总经济师兼劳动和卫生处处长，东南沿海铁路福建有限责任公司副总经理、副董事长、总经理兼南昌铁路局副局长。', '1', '学长是工业与民用建筑专业毕业生，离校后从事的一直是工程管理相关工作，在专业认知上已然有了自己的看法。对于土建类女生就业难的问题，他认为，这确实是客观存在的，多因女性天生的生理特征与对现场工作特定条件存在诸多的不适应性，但同时女生的细心、细腻等又成为其优势，每个企业的要求不尽相同，这就与女生自身心态的调整有很大的关系。女生只要在工作的过程中，发挥本身优势，有意识的弥补自己客观的不足，同样也能够得到单位的认可。他认为在这个问题上，企业需要承担更多责任，男女应一视同仁，甚至可以做出倾斜，同时男生也需要给予女生多一些支持。现在的企业多从最简单、直观的感觉来判定男生在日后的工作中定会比女生作用大，但女生也有自身的优势，在成家之后往往会选择一种安定的生活，她们能够静下心来对待工作。\r\n\r\n　　学长认为学校和社会是两个不同的环境，走向社会之后是另一个转折，这一时期大学生应该调整好心态，勇敢乐观地面对现实与理想的落差。“现在毕业生跳槽的现象比较多，其中多半是因为走上工作岗位之后难以接受工作的现状而无法坚持。当我们步入工作岗位之后，如果想要得到相应的提升和成功，那就应该做到以岗位的需要为目标，当我们将岗位的要求和单位的需求结合起来，根据具体的情况谋划好将来的工作，那你的事业也将逐步走向成功。”\r\n\r\n　　在学长看来，当一个人能够在工作中更进一步思考，站在更高的高度去思考问题，并与单位的发展规划相符合的时候，就会很快得到大家的认可。因此，具备一套系统的思维显得十分重要，而这又往往来源于平时的好习惯。思想决定行为，长时间的积累就会形成习惯。大学生在日常生活中应培养良好的生活习惯，做事情要有条理。如今一些初来单位的大学毕业生，可能在校期间就没能养成良好的学习、生活习惯，并将这种状态延续到了工作中，这是对个人发展非常不利的。每天梳理学习和生活的同时努力约束自己，这有利于自己整理思维，养成习惯之后在工作中也会有清晰的思路，这对个人工作很有帮助。\r\n\r\n　　学长指出，不同年代的人都有不同的思维，在沟通上难免有“代沟”，这是正常的。现在的大学毕业生多是九零后，主张个性和特点，但是我们要知道在将来的工作岗位上面对的多是年长的领导，这时就应该做出相应调整，收敛自己的个性，正确、及时理解领导的思维和想法，并站在上司的角度看待问题，这将对自己的职业生涯大有帮助。\r\n', '2020-04-20'),
(6, '张江', '1990年毕业于机电工程学院', '1990年至1995年在四方机车车辆厂客车分厂总装车间担任助理工程师、工程师，从事产品的工艺技术工作；1995年任总装车间副主任；2001年，被选派赴澳大利亚伊迪思·科文大学攻读工商管理硕士；2005年任四方机车车辆股份有限公司制造部总装分厂厂长；2007年11月，王成龙被聘任为教授级高级工程师；2010年被聘任为中国南车集团青岛四方机车车辆有限公司副总经济师；2010年6月，走上高管岗位，主要分管公司人力资源、企业文化、纪委监察以及工会工作。    \r\n\r\n', '1', '大学不仅仅是“传道授业解惑”的校园，更是塑造一个人内在的圣地。在大学里培养出的处变不惊和沉稳踏实性格，一直陪伴着王成龙学长到现在——从工程师助理到厂长、工程师、经济师，这一路走来，虽然充满了辛酸，但也让王成龙学长收获颇丰。\r\n\r\n“态度决定一切”是王成龙学长所奉行的工作原则。“你的工作态度好的话，你就喜欢它，才会主动地去学更多的知识。其实在公司里学到的知识，与在学校里学的完全不一样。每一个公司都不一样，就算它的产品是一样的，但是它的生产流程也是不一样的，不同流程的优缺点也不一样，你抱着一个打杂的态度，你永远都不知道其中的奥秘，因此我认为态度是很重要的。”王成龙学长说道。有一个良好的态度是做好一件事的基础，好的心态能让付出有120%的回报，消极的心态却往往事倍功半。\r\n\r\n随着社会压力的增大，努力塑造好自身，对每个求职者来说都是一个必经的过程。成长是痛苦的，但是它开出的花儿是香甜的。成功的花儿总是用汗水浇灌，胜利的桂冠总是用荆棘编织。一个好的心态会让我们越挫越勇。我们只有义无反顾地向前走，才能前进，只有不放弃，一步一个脚印，我们就能进步。\r\n', '2020-04-20'),
(7, 'test', 'test', 'qwre', NULL, 'test', '2020-04-21');

-- --------------------------------------------------------

--
-- 表的结构 `leader`
--

CREATE TABLE `leader` (
  `leader_id` int(11) NOT NULL,
  `leader_name` varchar(255) DEFAULT NULL,
  `leader_pos` varchar(255) DEFAULT NULL,
  `leader_url` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `leader_con` mediumtext CHARACTER SET utf8mb4,
  `leader_time` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `leader`
--

INSERT INTO `leader` (`leader_id`, `leader_name`, `leader_pos`, `leader_url`, `leader_con`, `leader_time`) VALUES
(1, '张三', '校长', '1', '现任学校校长', '2020-04-20'),
(2, '李四', '党委书记', '1', '党委书记', '2020-04-20'),
(3, '王五', '党委副书记', '1', '党委副书记', '2020-04-20'),
(4, '赵六', '副校长', '1', '副校长', '2020-04-20'),
(5, '刘七', '副校长', '1', '副校长', '2020-04-20'),
(8, '张三', '校长11', NULL, '现任学校校长111', '2020-04-21'),
(6, '东东', '副主任', NULL, '副主任', '2020-04-21'),
(7, '马六', '主任', '1', '年级主任', '2020-04-21'),
(12, 'test1', 'test2354678', NULL, 'test111', '2020-04-23');

-- --------------------------------------------------------

--
-- 表的结构 `leave_msg`
--

CREATE TABLE `leave_msg` (
  `msg_id` int(11) NOT NULL,
  `msg_con` mediumtext CHARACTER SET utf8mb4,
  `msg_name` varchar(100) DEFAULT NULL,
  `msg_time` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `leave_msg`
--

INSERT INTO `leave_msg` (`msg_id`, `msg_con`, `msg_name`, `msg_time`) VALUES
(1, '热烈庆祝母校七十周年校庆，愿母校的明天越来越辉煌，愿全校师生砥砺奋进，共创佳绩！', 'admin', '2020-04-14'),
(2, '年风雨兼程，十年青春如歌。年华流转，不变的是学者心;岁月如流，永恒的是师者魂。用生命启迪智慧，用爱心滋养希望。十年，创造金色辉煌;十年，谱写绚丽华章!', 'admin', '2020-04-14'),
(3, '浦江之畔，百年图强，沧桑何足惧;东海之滨桃李芬芳，明朝更辉煌!', 'admin', '2020-04-14'),
(4, '1111热烈庆祝母校七十周年校庆，愿母校的明天越来越辉煌，愿全校师生砥砺奋进，共创佳绩！', 'luokaixing', '2020-04-14'),
(5, '1111年风雨兼程，十年青春如歌。年华流转，不变的是学者心;岁月如流，永恒的是师者魂。用生命启迪智慧，用爱心滋养希望。十年，创造金色辉煌;十年，谱写绚丽华章!', 'luokaixing', '2020-04-14'),
(6, '1111浦江之畔，百年图强，沧桑何足惧;东海之滨桃李芬芳，明朝更辉煌!', 'luokaixing', '2020-04-14'),
(7, '亲爱的母校，在您的70年华诞，我们再一次簇拥在您的身旁，仰望您参天大树般的身姿，衷心祝愿您永葆青春，在教育改革的道路上永争第一!', 'luokaixing1', '2020-04-14'),
(8, '青春是你的招牌，活力是你的王牌，而我们愿做您自豪的广告牌。希望六中——六六大顺，越办越好。', 'luokaixing1', '2020-04-14'),
(9, '山东科大，屹立东方，双五华诞，美丽辉煌;辛勤耕耘，桃李出墙，精心哺育，永生难忘;长江后浪，更加光芒，科大强壮，直上九霄。', 'luokaixing1', '2020-04-14'),
(10, '十五年铸就了一段辉煌，编织着我们的梦想，十五年如神话般迅猛发展，承载这我们的希望。', 'luokaixing2', '2020-04-14'),
(12, '今天下雨了，但是总体感觉还是不错的，我也没出去，马上出去吃饭了！', 'admin', '2020-04-19'),
(13, 'test留言测试是否生效，做完这个马上出去吃饭了', 'admin', '2020-04-19'),
(14, '提交，loading效果测试', 'admin', '2020-04-19'),
(15, '提及哦啊，留言内容11111', 'admin', '2020-04-19'),
(16, '现在是北京时间，晚上六点半', 'admin', '2020-04-19'),
(18, '被窝是青春的坟墓，在这座坟墓中，我早已化做一堆枯骨！', 'admin', '2020-04-19'),
(19, '风雨兼程，十年寒窗苦读，你是否也想过要放弃', 'admin', '2020-04-19'),
(20, 'tetsttsatfsadg', 'admin', '2020-04-23');

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `news_title` varchar(255) DEFAULT NULL,
  `news_con` mediumtext CHARACTER SET utf8mb4,
  `news_time` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `news`
--

INSERT INTO `news` (`news_id`, `news_title`, `news_con`, `news_time`) VALUES
(1, '如何避免校园踩踏事件', '其实，我们仔细的想一想，踩踏事故的发生实际由再平常不过的走路引起来的，是个体行为所至。这就说明，一些人并没有把走路当回事，其实不然。 如何走路？在当今发生的踩踏事故面前变的异常重要。单纯从生理功能、自然发育的角度看，对于一个四肢健全的人来说有谁不会走路的？但是，如何在人类社会中走路，其实并不是一个可以无师自通、无须教育的行为。这也就是说，如何走路，并不是一个仅仅与个人身体发育有关的生理、自然问题，更是一个涉及心理成长、理性成熟，如何把握和处理人与人、人与社会之间的人伦关系，关乎行为伦理、文明素养的社会问题、教育问题。\r\n                                                        \r\n1、举止文明，人多的时候不拥挤、不起哄、不制造紧张或恐慌气氛。\r\n\r\n2、发现不文明的行为要敢于劝阻和制止。\r\n\r\n3、尽量避免到拥挤的人群中，不得已时，尽量走在人流的边缘。\r\n\r\n4、应顺着人流走，切不可逆着人流前进，否则，很容易被人流推倒。\r\n\r\n5、发觉拥挤的人群向自己行走的方向来时，应立即避到一旁，不要慌乱，不要奔跑，避免摔倒。\r\n\r\n6、陷入拥挤的人流时，一定要先站稳，身体不要倾斜失去重心，即使鞋子被踩掉，也不要贸然弯腰提鞋或系鞋带。有可能的话，可先尽快抓住坚固可靠的东西慢慢走动或停住，待人群过去后，迅速离开现场。\r\n\r\n7、若自己被人群拥倒后，要设法靠近墙角，身体蜷成球状，双手在颈后紧扣以保护身体最脆弱的部位。\r\n\r\n8、在人群中走动，遇到台阶或楼梯时，尽量抓住扶手，防止摔倒。', '2020-04-15'),
(2, '校园欺凌事件怎样避免', '1.向欺凌说不\r\n\r\n在被欺凌的时候一定要勇敢抗争，要学会说“不”。施暴者多半是觉得受害人好欺负才会实施欺凌，如果就这样妥协，那么这样的第一次妥协其实就纵容、鼓励了拦截者，就会带来更不良的后果。\r\n\r\n2.及时报告\r\n\r\n勒索、敲诈经常是同暴力紧密联系的，我们提倡在“不怕”的前提下与之抗争，但不意味着逞一时之勇，反而造成不必要的伤害。因此要及时向学校、家长报告。第一次遇到拦截后的表现是十分重要的。无论对方的目的是否得逞，如果一味害怕而忍气吞声，或是不想宣扬，会在无形中助长对方的气焰，使得对方以为你软弱可欺，往往会导致新的勒索、敲诈和殴打事件的发生。\r\n\r\n3.将防欺凌纳入家庭教育\r\n\r\n校园欺凌无疑是客观存在的，那家长们在平时就要帮助孩子确立防范意识，告诉孩子生活美好的同时，也要让孩子理解生活中还有不完美的地方，还存在恶行。孩子认识理解生活、确立防范警惕意识，可谓预防欺凌的第一屏障。最后是注意教育指导孩子学会沟通，把握同学间的相处交往分寸，及时化解矛盾冲突，尽可能主动适应学校生活。', '2020-04-15'),
(3, '校园安全事件频繁发生 加强校园安全刻不容缓', '受中国传统因素以及侥幸心理影响，人们的保险意识还十分薄弱，公共责任险始终得不到消费者的认同，保险公司公众责任险的业务量也很小，市场需求和发达国家比起来还有很大差距。但是，随着袭童事件、煤窑安全事故的频发，为多少家庭蒙受了灾难的阴影，我们为受害人婉惜，同时公众责任险的缺失也让我们无奈。\r\n\r\n所谓公众责任，是指致害人在公众活动场所的过错行为致使他人的人身或者财产遭受损害，依法应由致害人承担的对受害人的经济赔偿责任。公众责任保险以被保险人的相关责任为承保对象，是责任保险中独立的、适用范围极为广泛的保险类别。公众责任保险主要包括被保险人在保险期限内、在保险地点发生的依法应该承担的经济赔偿责任和有关合理的费用等由保险公司进行赔偿。\r\n\r\n当下全国关注的热点问题--袭童事件的连续发生，校园安全已经成为了现如今的焦点问题。孩子的健康成长牵动着全家人的心，对遇难儿童家庭的精神损失社会无法弥补，我们全社会在投入更多的精力去防止和杜绝类似情况发生的同时，我们是可以在经济上作一定的安排呢?如校方责任险等与一些未成年人有关社会责任险都将是一种很好的财务安排，完全可以加大这些责任险的推广。\r\n\r\n屡禁不止的中国煤炭安全事故现象，引发我们的不应该仅仅是对煤炭安全生产的关注，更应该引起社会各界尤其是保险界人士对于公共安全责任险的重视。在全国人民的焦点集中在煤炭事故频发的各种原因与违规操作的同时，我们可以更多地去关心死难者家属以后的生活情况，通过加大煤矿安全责任险的推广与实施，对死难者家庭给予更多经济上关怀。在加大打击黑煤窑、提高安全生产条件的同时，有关部门可以效仿交强险的模式，对煤矿安全情况实行强制责任保险制度，在发生事故后由煤矿安全责任险进行赔偿，也是一种事后的经济补偿方法。', '2020-04-15'),
(4, '1111如何避免校园踩踏事件', '其实，我们仔细的想一想，踩踏事故的发生实际由再平常不过的走路引起来的，是个体行为所至。这就说明，一些人并没有把走路当回事，其实不然。 如何走路？在当今发生的踩踏事故面前变的异常重要。单纯从生理功能、自然发育的角度看，对于一个四肢健全的人来说有谁不会走路的？但是，如何在人类社会中走路，其实并不是一个可以无师自通、无须教育的行为。这也就是说，如何走路，并不是一个仅仅与个人身体发育有关的生理、自然问题，更是一个涉及心理成长、理性成熟，如何把握和处理人与人、人与社会之间的人伦关系，关乎行为伦理、文明素养的社会问题、教育问题。\r\n                                                        \r\n1、举止文明，人多的时候不拥挤、不起哄、不制造紧张或恐慌气氛。\r\n\r\n2、发现不文明的行为要敢于劝阻和制止。\r\n\r\n3、尽量避免到拥挤的人群中，不得已时，尽量走在人流的边缘。\r\n\r\n4、应顺着人流走，切不可逆着人流前进，否则，很容易被人流推倒。\r\n\r\n5、发觉拥挤的人群向自己行走的方向来时，应立即避到一旁，不要慌乱，不要奔跑，避免摔倒。\r\n\r\n6、陷入拥挤的人流时，一定要先站稳，身体不要倾斜失去重心，即使鞋子被踩掉，也不要贸然弯腰提鞋或系鞋带。有可能的话，可先尽快抓住坚固可靠的东西慢慢走动或停住，待人群过去后，迅速离开现场。\r\n\r\n7、若自己被人群拥倒后，要设法靠近墙角，身体蜷成球状，双手在颈后紧扣以保护身体最脆弱的部位。\r\n\r\n8、在人群中走动，遇到台阶或楼梯时，尽量抓住扶手，防止摔倒。', '2020-04-15'),
(5, '1111校园欺凌事件怎样避免', '1.向欺凌说不\r\n\r\n在被欺凌的时候一定要勇敢抗争，要学会说“不”。施暴者多半是觉得受害人好欺负才会实施欺凌，如果就这样妥协，那么这样的第一次妥协其实就纵容、鼓励了拦截者，就会带来更不良的后果。\r\n\r\n2.及时报告\r\n\r\n勒索、敲诈经常是同暴力紧密联系的，我们提倡在“不怕”的前提下与之抗争，但不意味着逞一时之勇，反而造成不必要的伤害。因此要及时向学校、家长报告。第一次遇到拦截后的表现是十分重要的。无论对方的目的是否得逞，如果一味害怕而忍气吞声，或是不想宣扬，会在无形中助长对方的气焰，使得对方以为你软弱可欺，往往会导致新的勒索、敲诈和殴打事件的发生。\r\n\r\n3.将防欺凌纳入家庭教育\r\n\r\n校园欺凌无疑是客观存在的，那家长们在平时就要帮助孩子确立防范意识，告诉孩子生活美好的同时，也要让孩子理解生活中还有不完美的地方，还存在恶行。孩子认识理解生活、确立防范警惕意识，可谓预防欺凌的第一屏障。最后是注意教育指导孩子学会沟通，把握同学间的相处交往分寸，及时化解矛盾冲突，尽可能主动适应学校生活。', '2020-04-15'),
(6, '1111校园安全事件频繁发生 加强校园安全刻不容缓', '受中国传统因素以及侥幸心理影响，人们的保险意识还十分薄弱，公共责任险始终得不到消费者的认同，保险公司公众责任险的业务量也很小，市场需求和发达国家比起来还有很大差距。但是，随着袭童事件、煤窑安全事故的频发，为多少家庭蒙受了灾难的阴影，我们为受害人婉惜，同时公众责任险的缺失也让我们无奈。\r\n\r\n所谓公众责任，是指致害人在公众活动场所的过错行为致使他人的人身或者财产遭受损害，依法应由致害人承担的对受害人的经济赔偿责任。公众责任保险以被保险人的相关责任为承保对象，是责任保险中独立的、适用范围极为广泛的保险类别。公众责任保险主要包括被保险人在保险期限内、在保险地点发生的依法应该承担的经济赔偿责任和有关合理的费用等由保险公司进行赔偿。\r\n\r\n当下全国关注的热点问题--袭童事件的连续发生，校园安全已经成为了现如今的焦点问题。孩子的健康成长牵动着全家人的心，对遇难儿童家庭的精神损失社会无法弥补，我们全社会在投入更多的精力去防止和杜绝类似情况发生的同时，我们是可以在经济上作一定的安排呢?如校方责任险等与一些未成年人有关社会责任险都将是一种很好的财务安排，完全可以加大这些责任险的推广。\r\n\r\n屡禁不止的中国煤炭安全事故现象，引发我们的不应该仅仅是对煤炭安全生产的关注，更应该引起社会各界尤其是保险界人士对于公共安全责任险的重视。在全国人民的焦点集中在煤炭事故频发的各种原因与违规操作的同时，我们可以更多地去关心死难者家属以后的生活情况，通过加大煤矿安全责任险的推广与实施，对死难者家庭给予更多经济上关怀。在加大打击黑煤窑、提高安全生产条件的同时，有关部门可以效仿交强险的模式，对煤矿安全情况实行强制责任保险制度，在发生事故后由煤矿安全责任险进行赔偿，也是一种事后的经济补偿方法。', '2020-04-15'),
(7, '如何避免校园踩踏事件', '其实，我们仔细的想一想，踩踏事故的发生实际由再平常不过的走路引起来的，是个体行为所至。这就说明，一些人并没有把走路当回事，其实不然。 如何走路？在当今发生的踩踏事故面前变的异常重要。单纯从生理功能、自然发育的角度看，对于一个四肢健全的人来说有谁不会走路的？但是，如何在人类社会中走路，其实并不是一个可以无师自通、无须教育的行为。这也就是说，如何走路，并不是一个仅仅与个人身体发育有关的生理、自然问题，更是一个涉及心理成长、理性成熟，如何把握和处理人与人、人与社会之间的人伦关系，关乎行为伦理、文明素养的社会问题、教育问题。\r\n                                                        \r\n1、举止文明，人多的时候不拥挤、不起哄、不制造紧张或恐慌气氛。\r\n\r\n2、发现不文明的行为要敢于劝阻和制止。\r\n\r\n3、尽量避免到拥挤的人群中，不得已时，尽量走在人流的边缘。\r\n\r\n4、应顺着人流走，切不可逆着人流前进，否则，很容易被人流推倒。\r\n\r\n5、发觉拥挤的人群向自己行走的方向来时，应立即避到一旁，不要慌乱，不要奔跑，避免摔倒。\r\n\r\n6、陷入拥挤的人流时，一定要先站稳，身体不要倾斜失去重心，即使鞋子被踩掉，也不要贸然弯腰提鞋或系鞋带。有可能的话，可先尽快抓住坚固可靠的东西慢慢走动或停住，待人群过去后，迅速离开现场。\r\n\r\n7、若自己被人群拥倒后，要设法靠近墙角，身体蜷成球状，双手在颈后紧扣以保护身体最脆弱的部位。\r\n\r\n8、在人群中走动，遇到台阶或楼梯时，尽量抓住扶手，防止摔倒。', '2020-04-15'),
(8, '校园欺凌事件怎样避免', '1.向欺凌说不\r\n\r\n在被欺凌的时候一定要勇敢抗争，要学会说“不”。施暴者多半是觉得受害人好欺负才会实施欺凌，如果就这样妥协，那么这样的第一次妥协其实就纵容、鼓励了拦截者，就会带来更不良的后果。\r\n\r\n2.及时报告\r\n\r\n勒索、敲诈经常是同暴力紧密联系的，我们提倡在“不怕”的前提下与之抗争，但不意味着逞一时之勇，反而造成不必要的伤害。因此要及时向学校、家长报告。第一次遇到拦截后的表现是十分重要的。无论对方的目的是否得逞，如果一味害怕而忍气吞声，或是不想宣扬，会在无形中助长对方的气焰，使得对方以为你软弱可欺，往往会导致新的勒索、敲诈和殴打事件的发生。\r\n\r\n3.将防欺凌纳入家庭教育\r\n\r\n校园欺凌无疑是客观存在的，那家长们在平时就要帮助孩子确立防范意识，告诉孩子生活美好的同时，也要让孩子理解生活中还有不完美的地方，还存在恶行。孩子认识理解生活、确立防范警惕意识，可谓预防欺凌的第一屏障。最后是注意教育指导孩子学会沟通，把握同学间的相处交往分寸，及时化解矛盾冲突，尽可能主动适应学校生活。', '2020-04-15'),
(9, '校园安全事件频繁发生 加强校园安全刻不容缓', '受中国传统因素以及侥幸心理影响，人们的保险意识还十分薄弱，公共责任险始终得不到消费者的认同，保险公司公众责任险的业务量也很小，市场需求和发达国家比起来还有很大差距。但是，随着袭童事件、煤窑安全事故的频发，为多少家庭蒙受了灾难的阴影，我们为受害人婉惜，同时公众责任险的缺失也让我们无奈。\r\n\r\n所谓公众责任，是指致害人在公众活动场所的过错行为致使他人的人身或者财产遭受损害，依法应由致害人承担的对受害人的经济赔偿责任。公众责任保险以被保险人的相关责任为承保对象，是责任保险中独立的、适用范围极为广泛的保险类别。公众责任保险主要包括被保险人在保险期限内、在保险地点发生的依法应该承担的经济赔偿责任和有关合理的费用等由保险公司进行赔偿。\r\n\r\n当下全国关注的热点问题--袭童事件的连续发生，校园安全已经成为了现如今的焦点问题。孩子的健康成长牵动着全家人的心，对遇难儿童家庭的精神损失社会无法弥补，我们全社会在投入更多的精力去防止和杜绝类似情况发生的同时，我们是可以在经济上作一定的安排呢?如校方责任险等与一些未成年人有关社会责任险都将是一种很好的财务安排，完全可以加大这些责任险的推广。\r\n\r\n屡禁不止的中国煤炭安全事故现象，引发我们的不应该仅仅是对煤炭安全生产的关注，更应该引起社会各界尤其是保险界人士对于公共安全责任险的重视。在全国人民的焦点集中在煤炭事故频发的各种原因与违规操作的同时，我们可以更多地去关心死难者家属以后的生活情况，通过加大煤矿安全责任险的推广与实施，对死难者家庭给予更多经济上关怀。在加大打击黑煤窑、提高安全生产条件的同时，有关部门可以效仿交强险的模式，对煤矿安全情况实行强制责任保险制度，在发生事故后由煤矿安全责任险进行赔偿，也是一种事后的经济补偿方法。', '2020-04-15'),
(10, '1111如何避免校园踩踏事件', '其实，我们仔细的想一想，踩踏事故的发生实际由再平常不过的走路引起来的，是个体行为所至。这就说明，一些人并没有把走路当回事，其实不然。 如何走路？在当今发生的踩踏事故面前变的异常重要。单纯从生理功能、自然发育的角度看，对于一个四肢健全的人来说有谁不会走路的？但是，如何在人类社会中走路，其实并不是一个可以无师自通、无须教育的行为。这也就是说，如何走路，并不是一个仅仅与个人身体发育有关的生理、自然问题，更是一个涉及心理成长、理性成熟，如何把握和处理人与人、人与社会之间的人伦关系，关乎行为伦理、文明素养的社会问题、教育问题。\r\n                                                        \r\n1、举止文明，人多的时候不拥挤、不起哄、不制造紧张或恐慌气氛。\r\n\r\n2、发现不文明的行为要敢于劝阻和制止。\r\n\r\n3、尽量避免到拥挤的人群中，不得已时，尽量走在人流的边缘。\r\n\r\n4、应顺着人流走，切不可逆着人流前进，否则，很容易被人流推倒。\r\n\r\n5、发觉拥挤的人群向自己行走的方向来时，应立即避到一旁，不要慌乱，不要奔跑，避免摔倒。\r\n\r\n6、陷入拥挤的人流时，一定要先站稳，身体不要倾斜失去重心，即使鞋子被踩掉，也不要贸然弯腰提鞋或系鞋带。有可能的话，可先尽快抓住坚固可靠的东西慢慢走动或停住，待人群过去后，迅速离开现场。\r\n\r\n7、若自己被人群拥倒后，要设法靠近墙角，身体蜷成球状，双手在颈后紧扣以保护身体最脆弱的部位。\r\n\r\n8、在人群中走动，遇到台阶或楼梯时，尽量抓住扶手，防止摔倒。', '2020-04-15'),
(11, '1111校园欺凌事件怎样避免', '1.向欺凌说不\r\n\r\n在被欺凌的时候一定要勇敢抗争，要学会说“不”。施暴者多半是觉得受害人好欺负才会实施欺凌，如果就这样妥协，那么这样的第一次妥协其实就纵容、鼓励了拦截者，就会带来更不良的后果。\r\n\r\n2.及时报告\r\n\r\n勒索、敲诈经常是同暴力紧密联系的，我们提倡在“不怕”的前提下与之抗争，但不意味着逞一时之勇，反而造成不必要的伤害。因此要及时向学校、家长报告。第一次遇到拦截后的表现是十分重要的。无论对方的目的是否得逞，如果一味害怕而忍气吞声，或是不想宣扬，会在无形中助长对方的气焰，使得对方以为你软弱可欺，往往会导致新的勒索、敲诈和殴打事件的发生。\r\n\r\n3.将防欺凌纳入家庭教育\r\n\r\n校园欺凌无疑是客观存在的，那家长们在平时就要帮助孩子确立防范意识，告诉孩子生活美好的同时，也要让孩子理解生活中还有不完美的地方，还存在恶行。孩子认识理解生活、确立防范警惕意识，可谓预防欺凌的第一屏障。最后是注意教育指导孩子学会沟通，把握同学间的相处交往分寸，及时化解矛盾冲突，尽可能主动适应学校生活。', '2020-04-15'),
(12, '1111校园安全事件频繁发生 加强校园安全刻不容缓', '受中国传统因素以及侥幸心理影响，人们的保险意识还十分薄弱，公共责任险始终得不到消费者的认同，保险公司公众责任险的业务量也很小，市场需求和发达国家比起来还有很大差距。但是，随着袭童事件、煤窑安全事故的频发，为多少家庭蒙受了灾难的阴影，我们为受害人婉惜，同时公众责任险的缺失也让我们无奈。\r\n\r\n所谓公众责任，是指致害人在公众活动场所的过错行为致使他人的人身或者财产遭受损害，依法应由致害人承担的对受害人的经济赔偿责任。公众责任保险以被保险人的相关责任为承保对象，是责任保险中独立的、适用范围极为广泛的保险类别。公众责任保险主要包括被保险人在保险期限内、在保险地点发生的依法应该承担的经济赔偿责任和有关合理的费用等由保险公司进行赔偿。\r\n\r\n当下全国关注的热点问题--袭童事件的连续发生，校园安全已经成为了现如今的焦点问题。孩子的健康成长牵动着全家人的心，对遇难儿童家庭的精神损失社会无法弥补，我们全社会在投入更多的精力去防止和杜绝类似情况发生的同时，我们是可以在经济上作一定的安排呢?如校方责任险等与一些未成年人有关社会责任险都将是一种很好的财务安排，完全可以加大这些责任险的推广。\r\n\r\n屡禁不止的中国煤炭安全事故现象，引发我们的不应该仅仅是对煤炭安全生产的关注，更应该引起社会各界尤其是保险界人士对于公共安全责任险的重视。在全国人民的焦点集中在煤炭事故频发的各种原因与违规操作的同时，我们可以更多地去关心死难者家属以后的生活情况，通过加大煤矿安全责任险的推广与实施，对死难者家庭给予更多经济上关怀。在加大打击黑煤窑、提高安全生产条件的同时，有关部门可以效仿交强险的模式，对煤矿安全情况实行强制责任保险制度，在发生事故后由煤矿安全责任险进行赔偿，也是一种事后的经济补偿方法。', '2020-04-15');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `class_no` varchar(255) DEFAULT NULL,
  `is_excellent` int(10) NOT NULL DEFAULT '0',
  `grade` int(10) NOT NULL,
  `class` varchar(255) NOT NULL,
  `stuno` int(255) NOT NULL COMMENT '学号',
  `major` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `gender` varchar(4) NOT NULL,
  `phone` bigint(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `classId` int(40) DEFAULT '0',
  `create_time` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `class_no`, `is_excellent`, `grade`, `class`, `stuno`, `major`, `gender`, `phone`, `address`, `birthday`, `company`, `classId`, `create_time`) VALUES
(1, 'admin', 'admin123', '2016_01', 0, 2016, '2016_01', 123456, '软件', '男', 13344556677, '上海闵行区福利公寓', '1997-03-02', '银行', 0, '2020-04-12'),
(2, 'luokaixing', 'luokaixing123', '0', 0, 2014, '2016_01', 201611, '软件工程', '男', 15144557788, '上海闵行区', '2020-04-13', '上海', 0, '2020-04-12'),
(3, 'luokaixing1', 'luokaixing1', '2016_03', 0, 2015, '2016_02', 201602, '金融', '男', 18877554477, '江西', '2020-04-07', '缉拿关系', 0, '2020-04-12'),
(4, 'luokaixing2', 'luokaixing2', '0', 0, 2017, '2016_03', 201667, '外国语', '男', 18899776644, '南昌', '2020-04-07', '中铁集团', 0, '2020-04-12'),
(5, 'luokaixing3', 'luokaixing3', '0', 0, 2018, '2016_04', 201689, '金融', '女', 14566889977, '吉安', '2020-04-01', '票交所', 0, '2020-04-12'),
(6, 'luokaixing4', 'luokaixing4', '0', 0, 2011, '2016_01', 201601, '轨道交通', '女', 15699004433, '北京', '2020-04-20', '信息技术', 0, '2020-04-12'),
(7, 'luokaixing5', 'luokaixing5', '0', 0, 2012, '2016_01', 201602, '轨道交通', '男', 15699004445, '陕西', '2020-04-01', '经济贸易', 0, '2020-04-12'),
(8, 'test0011', 'test0011', '0', 0, 2013, '2016_02', 201623, '软件', '男', 16788776655, '上海', '2014-04-02', '银联有限公司', 0, '2020-04-12'),
(9, 'admin01', 'admin123', '0', 0, 2016, '2016_01', 123456, '软件', '男', 13344556677, '上海', '1997-03-02', '银行', 0, '2020-04-12'),
(10, 'luokaixing01', 'luokaixing123', '0', 0, 2014, '2016_01', 201611, '软件', '男', 15144557788, '上海', '2020-04-13', '上海', 0, '2020-04-12'),
(11, 'luokaixing101', 'luokaixing1', '0', 0, 2015, '2016_02', 201602, '金融', '男', 18877554477, '江西', '2020-04-07', '缉拿关系', 0, '2020-04-12'),
(12, 'luokaixing201', 'luokaixing2', '0', 0, 2017, '2016_03', 201667, '外国语', '男', 18899776644, '南昌', '2020-04-07', '中铁集团', 0, '2020-04-12'),
(13, 'luokaixing301', 'luokaixing3', '0', 0, 2018, '2016_04', 201689, '金融', '女', 14566889977, '吉安', '2020-04-01', '票交所', 0, '2020-04-12'),
(14, 'luokaixing401', 'luokaixing4', '0', 0, 2011, '2016_01', 201601, '轨道交通', '女', 15699004433, '北京', '2020-04-20', '信息技术', 0, '2020-04-12'),
(15, 'luokaixing501', 'luokaixing5', '0', 0, 2012, '2016_01', 201602, '轨道交通', '男', 15699004445, '陕西', '2020-04-01', '经济贸易', 0, '2020-04-12'),
(16, 'test001101', 'test0011', '0', 0, 2013, '2016_02', 201623, '软件', '男', 16788776655, '上海', '2014-04-02', '银联有限公司', 0, '2020-04-12'),
(17, '罗开星', 'luokaixing12345', '2016_02', 0, 2015, '2016_03', 201695, '软件', '男', 15644338866, '江西省吉安市', '2020-04-01', '无业游民', 0, '2020-04-19'),
(19, 'testname', 'testname1', '0', 0, 2019, '210734', 142545, '金融', '女', 16754332245, '湖北武汉', '2020-04-15', '武汉信息技术', 0, '2020-04-23'),
(20, 'hello', 'hello123', '0', 0, 2010, '2018_02', 201432, '外国语', '男', 16987632345, '内蒙古哈哈哈', '2020-04-09', '伊利牛奶', 0, '2020-04-23');

--
-- 转储表的索引
--

--
-- 表的索引 `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`);

--
-- 表的索引 `excellent`
--
ALTER TABLE `excellent`
  ADD PRIMARY KEY (`excellent_id`);

--
-- 表的索引 `leader`
--
ALTER TABLE `leader`
  ADD PRIMARY KEY (`leader_id`);

--
-- 表的索引 `leave_msg`
--
ALTER TABLE `leave_msg`
  ADD PRIMARY KEY (`msg_id`);

--
-- 表的索引 `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`,`username`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `excellent`
--
ALTER TABLE `excellent`
  MODIFY `excellent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `leader`
--
ALTER TABLE `leader`
  MODIFY `leader_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `leave_msg`
--
ALTER TABLE `leave_msg`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用表AUTO_INCREMENT `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
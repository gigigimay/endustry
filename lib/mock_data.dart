import './models.dart';

// data
const List<Service> MOCK_SERVICES = [
  Service(
      id: 'sv01',
      name: 'ระบบรับแจ้งข้อเท็จจริงของผู้นำเข้าหรือส่งออก ซึ่งวัตถุอันตราย',
      description:
          'คำอธิบาย ระบบรับแจ้งข้อเท็จจริงของผู้นำเข้าหรือส่งออก ซึ่งวัตถุอันตราย',
      url: 'https://www.google.com/',
      depId: 'dep01'),
  Service(
      id: 'sv02',
      name: 'นะโม ตัสสะ ภะคะวะโต อะระหะโต สัมมาสัมพุท ธัสสะ',
      description: 'คำอธิบาย นะโม ตัสสะ ภะคะวะโต อะระหะโต สัมมาสัมพุท ธัสสะ',
      url: 'https://www.google.com/',
      depId: 'dep02'),
  Service(
      id: 'sv03',
      name: 'นะโม ตัสสะ ภะคะวะโต อะระหะโต สัมมาสัมพุท ธัสสะ',
      description: 'คำอธิบาย นะโม ตัสสะ ภะคะวะโต อะระหะโต สัมมาสัมพุท ธัสสะ',
      url: 'https://www.google.com/',
      depId: 'dep02'),
  Service(
      id: 'sv04',
      name: 'นะโม ตัสสะ ภะคะวะโต อะระหะโต สัมมาสัมพุท ธัสสะ',
      description: 'คำอธิบาย นะโม ตัสสะ ภะคะวะโต อะระหะโต สัมมาสัมพุท ธัสสะ',
      url: 'https://www.google.com/',
      depId: 'dep02'),
  Service(
      id: 'sv05',
      name: 'มะริ่งกิ่งก่อง สะระน๊องก่องแก่ง',
      description: 'คำอธิบาย มะริ่งกิ่งก่อง สะระน๊องก่องแก่ง',
      url: 'https://www.google.com/',
      depId: 'dep03'),
  Service(
      id: 'sv06',
      name: 'มะน่องมะแน่งมั๊บ ปะล่องป่องแป่ง',
      description: 'คำอธิบาย มะน่องมะแน่งมั๊บ ปะล่องป่องแป่ง',
      url: 'https://www.google.com/',
      depId: 'dep03'),
  Service(
      id: 'sv07',
      name: 'ง้องแง้งง้องแง้ง ในชีวิตเธอ',
      description: 'คำอธิบาย ง้องแง้งง้องแง้ง ในชีวิตเธอ',
      url: 'https://www.google.com/',
      depId: 'dep03'),
];

const List<News> MOCK_NEWS = [
  News(
      id: 'nws01',
      title: 'ค่าธรรมเนียมโรงงาน ฟอหอกอดอ เอกอาสอวอค่าธรรมเนียมโรงงาน ฟอหอกอดอ เอกอาสอวอค่าธรรมเนียมโรงงาน ฟอหอกอดอ เอกอาสอวอ',
      content: 'Lorem1',
      date: '1969-07-20 20:18:04Z',
      author: 'ระนองระยอง',
      imgurl: 'img1',
      typeId: 'nwst00'),
  News(
      id: 'nws02',
      title: 'โดดดิด่ง',
      content: 'Lorem2',
      date: '1969-07-21 20:18:04Z',
      author: 'ประญุจ',
      imgurl: 'img2',
      typeId: 'nwst00'),
  News(
      id: 'nws03',
      title: 'เอิ้นหยังบ้ฮู้',
      content: 'แต่จังห้ะถึกใจ',
      date: '1969-07-21 20:18:04Z',
      author: 'น้ำ',
      imgurl: 'img3',
      typeId: 'nwst01'),
  News(
      id: 'nws04',
      title: 'ซวนกันไปแมะสู',
      content: 'สิยืนอยู่เห้ดอีหยางง',
      date: '1969-07-23 20:18:04Z',
      author: 'ใส',
      imgurl: 'img4',
      typeId: 'nwst01'),
  News(
      id: 'nws05',
      title: 'ชาดีดาดีด้าดีด้าดีด่าดีดาดี้ดาดีด้าด้าดา',
      content: 'ชาดีชาดีด้า ชาดีชาดี ด้า ดา ด้า ดา',
      date: '1969-07-23 20:18:04Z',
      author: 'นั้ลลัค',
      imgurl: 'img5',
      typeId: 'nwst02'),
];

const List<NewsType> MOCK_NEWSTYPES = [
  NewsType(id: 'nwst00', typeName: 'hilight'),
  NewsType(id: 'nwst01', typeName: 'ข่าวประชาสัมพันธ์'),
  NewsType(id: 'nwst02', typeName: 'ข่าวประจำจังหวัด'),
  NewsType(id: 'nwst03', typeName: 'ข่าวรับสมัครงาน')
];

User MOCK_USER = User(
    id: 'user01',
    email: 'nani@gmail.com',
    firstName: 'แพร',
    lastName: 'อ้วนนะ!',
    typeId: 'ust01',
    imgUrl: 'https://picsum.photos/200');

const List<UserType> MOCK_USERTYPES = [
  UserType(id: 'ust00', name: 'บุคคลทั่วไป'),
  UserType(id: 'ust01', name: 'ผู้ประกอบการ'),
];

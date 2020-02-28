import 'package:endustry/export.dart';

import './models.dart';

const String _VERYLONGTEXT =
    'เอิ้นอีหยังบ่ฮู้ แต่จังหว่ะถืกใจ(เรียกอะไรไม่รู้ แต่จังหวะถูกใจ)ซวนกันไปแมะสู… สิยืนอยู่เฮ็ดอีหยัง..(ชวนกันไปสิเธอ... จะยืนอยู่ทำไม)ชาดีดาดีดาดีดา ดีดาดีดาดีดาดีดาดีดาดีดาดีดาดีดา ดีด่า.. ด๋า.. ดา..ชาดีดาดีดา ด้า.. ชาดีดา ดีดา..ชาดีดาดีดา ด้า.. ดา.. ด๋า.. ดา…ยามมีบุญมีงาน พี่น้องพากันแตกอยู่ถ่วนถ่วนพากันไปฟ้อนไปฮ่อนไปม่วน(พากันไปฟ้อนรำไปร้อนไปสนุก)พากันมาลุม.. ตุ้ม.. โฮม..(พากันมารวมตัวกัน)จั๊กจังหว่ะอีหยัง บ่ค่อยคุ้นเคยกับหมู่ข่อยเลย(ไม่รู้จังหวะอะไร ไม่ค่อยคุ้นกับพวกเราเลย)สะกิดจังหว่ะในใจเฮาเสย(สะกิดจังหวะในใจเราซะงั้น)จนเหมิ่ดความเหงา.. เศร้า.. ระทม..(จนหมดความเหงา.. เศร้า..ระทม..)แดดสิฮ้อนป่านได๋ บ่มีผู้ได๋สิแล่นเข้าห่ม(แดดจะร้อนขนาดไหน ไม่มีใครวิ่งเข้าร่ม)แฮ่งระดมหมู่พวกมาม่วนกุ้มทีบ(ยิ่งพาเพื่อนฝูงมาสนุกสนาน)ฟ้อนใส่เสียงเครื่องสาย ลายม่วนม่วนม่วน(ฟ้อนรำใส่ดนตรีเครื่องสาย ลายเพลงสนุกสนาน)กวั้กมือซวน กันอยู่ไหว่ไหว่(กวักมือเรียก,ชวน กันให้รีบไป)เอิ้นอีหยังบ่ฮู้แต่จังหวะถืกใจ(เรียกอะไรไม่รู้ แต่จังหวะถูกใจ)ซวนกันไปแมะสู… สิยืนอยู่เฮ็ดอีหยัง(ชวนกันไปสิเธอ... จะยืนอยู่ทำไม)*ซ้ำ*จังหว่ะมันห้าว จ้าวม่วนเอาพอโล(จังหวะมันสนุกมากก เธอสนุกเอามาก)มีฮอดโอ้ละน้อ บ่เข้าใจฮอดความหมาย(มีถึงโอ้หละน้อ ไม่เข้าใจถึงความหมาย)แต่ถึกใจซุมตะเฮา ความหมองเศร้าจนบ่เหลือ(แต่ถูกใจพวกเรา ความหมองเศร้าจนไม่เหลือ)แฮ่งเครื่องสายดีดขึ้น เป็นจังหวะ(ยิ่งดนตรีเครื่องสายดีดขึ้น เป็นจังหวะ)โดดดิด่ง.. โดดดิด่ง..โดดดิด่ง โดดิโดดิโดดิโด่โดดิโดดิโดดิโด่ โดดิโดดิโดดดิด่งโดดดิด่ง.. โดดดิด่ง..โดดดิด่ง โดดิโดดิโดดิโด่โดดิโดดิโดดิโด่ โดดิโดดิโด่ดดิด่งโดดดิด่ง โดดิโดดิโดดดิด่งจนว่าหลงส่น ฟ้อนใส่ลายพิณโดดดิด่งชาดีดาดีดาดีดา ดีดาดีดาดีดาดีดาดีดาดีดาดีดาดีดา ดีด่า.. ด๋า.. ดา..ชาดีดาดีดา ด้า.. ชาดีดา ดีดา..ชาดีดาดีดา ด้า.. ดา.. ด๋า.. ดา…*ซ้ำ* โดดดิด่ง.. โดดดิด่ง..โดดดิด่ง โดดิโดดิโดดิโด่โดดิโดดิโดดิโด่ โดดิโดดิโดดดิด่งโดดดิด่ง โดดิโดดิโดดดิด่งจนว่าหลงส่น ฟ้อนใส่ลายพิณโดดดิด่งจังหว่ะมันห้าว จ้าวม่วนเอาพอโล(จังหวะมันสนุกมากก เธอสนุกเอามาก)มีฮอดโอ้ละน้อ บ่เข้าใจฮอดความหมาย(มีถึงโอ้หละน้อ ไม่เข้าใจถึงความหมาย)แต่ถึกใจซุมตะเฮา ความหมองเศร้าจนบ่เหลือ(แต่ถูกใจพวกเรา ความหมองเศร้าจนไม่เหลือ)แฮ่งเครื่องสายดีดขึ้น เป็นจังหวะ(ยิ่งดนตรีเครื่องสายดีดขึ้น เป็นจังหวะ)โดดดิด่ง.. โดดดิด่ง.. โดดดิด่ง โดดิโดดิโดดิโด่ โดดิโดดิโดดิโด่ โดดิโดดิโดดดิด่ง โดดดิด่ง.. โดดดิด่ง.. โดดดิด่ง โดดิโดดิโดดิโด่ โดดิโดดิโดดิโด่ โดดิโดดิโด่ดดิด่ง โดดดิด่ง โดดิโดดิโดดดิด่ง จนว่าหลงส่น ฟ้อนใส่ลายพิณโดดดิด่ง ถึงกับลืมรองเท้า ฟ้อนรำใส่รายดนตรี(พีณ)โดดดิด่ง จนว่าหลงส่น ฟ้อนใส่ลายพิณโดดดิด่ง ถึงกับลืมรองเท้า ฟ้อนรำใส่รายดนตรี(พีณ)โดดดิด่ง ชาดีดาดีดาดีดา ดีดาดีดาดีดาดีดาดีดาดีดาดีดาดีดา ดีด่า.. ด๋า.. ดา..ชาดีดาดีดา ด้า.. ชาดีดา ดีดา..ชาดีดาดีดา ด้า.. ดา.. ด๋า.. ดา…';

// data
const List<Service> MOCK_SERVICES = [
  Service(
    id: 'sv01',
    name: 'ระบบรับแจ้งข้อเท็จจริงของผู้นำเข้าหรือส่งออก ซึ่งวัตถุอันตราย',
    description:
        'คำอธิบาย ระบบรับแจ้งข้อเท็จจริงของผู้นำเข้าหรือส่งออก ซึ่งวัตถุอันตราย',
    url: 'https://www.google.com/',
    image: 'https://picsum.photos/150',
    depId: 'dep01',
  ),
  Service(
    id: 'sv02',
    name: 'หนึ่งนะโม ตัสสะ ภะคะวะโต อะระหะโต สัมมาสัมพุท ธัสสะ',
    description: 'คำอธิบาย นะโม ตัสสะ ภะคะวะโต อะระหะโต สัมมาสัมพุท ธัสสะ',
    url: 'https://www.google.com/',
    image: 'https://picsum.photos/151',
    depId: 'dep02',
  ),
  Service(
    id: 'sv03',
    name: 'สองนะโม ตัสสะ ภะคะวะโต อะระหะโต สัมมาสัมพุท ธัสสะ',
    description: 'คำอธิบาย นะโม ตัสสะ ภะคะวะโต อะระหะโต สัมมาสัมพุท ธัสสะ',
    url: 'https://www.google.com/',
    image: 'https://picsum.photos/152',
    depId: 'dep02',
  ),
  Service(
    id: 'sv04',
    name: 'สามนะโม ตัสสะ ภะคะวะโต อะระหะโต สัมมาสัมพุท ธัสสะ',
    description: 'คำอธิบาย นะโม ตัสสะ ภะคะวะโต อะระหะโต สัมมาสัมพุท ธัสสะ',
    url: 'https://www.google.com/',
    image: 'https://picsum.photos/153',
    depId: 'dep02',
  ),
  Service(
    id: 'sv05',
    name: 'มะริ่งกิ่งก่อง สะระน๊องก่องแก่ง',
    description: 'คำอธิบาย มะริ่งกิ่งก่อง สะระน๊องก่องแก่ง',
    url: 'https://www.google.com/',
    image: 'https://picsum.photos/154',
    depId: 'dep03',
  ),
  Service(
    id: 'sv06',
    name: 'มะน่องมะแน่งมั๊บ ปะล่องป่องแป่ง',
    description: 'คำอธิบาย มะน่องมะแน่งมั๊บ ปะล่องป่องแป่ง',
    url: 'https://www.google.com/',
    image: 'https://picsum.photos/155',
    depId: 'dep03',
  ),
  Service(
    id: 'sv07',
    name: 'ง้องแง้งง้องแง้ง ในชีวิตเธอ',
    description: 'คำอธิบาย ง้องแง้งง้องแง้ง ในชีวิตเธอ' + _VERYLONGTEXT,
    url: 'https://www.google.com/',
    image: 'https://picsum.photos/156',
    depId: 'dep03',
  ),
];

const List<News> MOCK_NEWS = [
  News(
    id: 'nws01',
    title:
        'ค่าธรรมเนียมโรงงาน ฟอหอกอดอ เอกอาสอวอค่าธรรมเนียมโรงงาน ฟอหอกอดอ เอกอาสอวอค่าธรรมเนียมโรงงาน ฟอหอกอดอ เอกอาสอวอ',
    content: 'Lorem1',
    date: '1969-07-20 20:18:04Z',
    author: 'ระนองระยอง',
    imgurl: 'https://picsum.photos/250',
    typeId: 'nwst00',
  ),
  News(
    id: 'nws02',
    title: 'โดดดิด่ง',
    content: 'Lorem2',
    date: '1969-07-21 20:18:04Z',
    author: 'ประญุจ',
    imgurl: 'https://picsum.photos/250',
    typeId: 'nwst00',
  ),
  News(
    id: 'nws03',
    title: 'เอิ้นหยังบ้ฮู้',
    content: 'แต่จังห้ะถึกใจ',
    date: '1969-07-21 20:18:04Z',
    author: 'น้ำ',
    imgurl: 'https://picsum.photos/200',
    typeId: 'nwst01',
  ),
  News(
    id: 'nws04',
    title: 'ซวนกันไปแมะสู',
    content: 'สิยืนอยู่เห้ดอีหยางง',
    date: '1969-07-23 20:18:04Z',
    author: 'ใส',
    imgurl: 'https://picsum.photos/200',
    typeId: 'nwst01',
  ),
  News(
    id: 'nws05',
    title: 'ชาดีดาดีด้าดีด้าดีด่าดีดาดี้ดาดีด้าด้าดา',
    content: 'ชาดีชาดีด้า ชาดีชาดี ด้า ดา ด้า ดา',
    date: '1969-07-23 20:18:04Z',
    author: 'นั้ลลัค',
    imgurl: 'https://picsum.photos/200',
    typeId: 'nwst02',
  ),
];

const List<NewsType> MOCK_NEWSTYPES = [
  NewsType(id: 'nwst00', typeName: 'hilight'),
  NewsType(id: 'nwst01', typeName: 'ข่าวประชาสัมพันธ์'),
  NewsType(id: 'nwst02', typeName: 'ข่าวประจำจังหวัด'),
  NewsType(id: 'nwst03', typeName: 'ข่าวรับสมัครงาน'),
];

const User MOCK_USER = User(
  id: 'user01',
  email: 'nani@gmail.com',
  firstName: 'แพร',
  lastName: 'อ้วนนะ!',
  typeId: 'ust01',
  imgUrl: 'https://picsum.photos/200',
  favKnowledges: ['knw02', 'knw03', 'knw05'],
  interestedTopics: ['kw02', 'kw08', 'kw04', 'kw06', 'kw10', 'kw13'],
);

const List<UserType> MOCK_USERTYPES = [
  UserType(
    id: 'ust00',
    name: 'บุคคลทั่วไป',
  ),
  UserType(
    id: 'ust01',
    name: 'ผู้ประกอบการ',
  ),
];

const List<Knowledge> MOCK_KNOWLEDGES = [
  Knowledge(
    id: 'knw01',
    title: 'โดดดิด่ง',
    content: _VERYLONGTEXT,
    date: '1969-07-21 20:18:04Z',
    author: 'ประญุจ',
    attachUrl: 'https://picsum.photos/200',
  ),
  Knowledge(
    id: 'knw02',
    title: 'เอิ้นหยังบ้ฮู้',
    content: 'แต่จังห้ะถึกใจ',
    date: '1969-07-21 20:18:04Z',
    author: 'น้ำ',
  ),
  Knowledge(
    id: 'knw03',
    title: 'ซวนกันไปแมะสู',
    content: 'สิยืนอยู่เห้ดอีหยางง',
    date: '1969-07-23 20:18:04Z',
    author: 'ใส',
  ),
  Knowledge(
    id: 'knw04',
    title: 'ชาดีดาดีด้าดีด้าดีด่าดีดาดี้ดาดีด้าด้าดา',
    content: 'ชาดีชาดีด้า ชาดีชาดี ด้า ดา ด้า ดา',
    date: '1969-07-23 20:18:04Z',
    author: 'นั้ลลัค',
    attachUrl: 'https://picsum.photos/200',
  ),
  Knowledge(
    id: 'knw05',
    title: 'ซวนกันไปแมะสู',
    content: 'สิยืนอยู่เห้ดอีหยางง',
    date: '1969-07-23 20:18:04Z',
    author: 'ใส',
  ),
  Knowledge(
    id: 'knw06',
    title:
        'ชาดีดาดีด้าดีด้าดีด่าดีดาดี้ดาดีด้าด้าดา ชาดีชาดีด้า ชาดีชาดี ด้า ดา ด้า ดา',
    content: 'ชาดีชาดีด้า ชาดีชาดี ด้า ดา ด้า ดา',
    date: '1969-07-23 20:18:04Z',
    author: 'นั้ลลัค',
    attachUrl: 'https://picsum.photos/200',
  ),
];

const List<Keyword> MOCK_KEYWORDS = [
  Keyword(id: 'kw01', name: 'อ้อย'),
  Keyword(id: 'kw02', name: 'โอ้หม่ายก้อด'),
  Keyword(id: 'kw03', name: 'กุ้งเผา'),
  Keyword(id: 'kw04', name: 'ไอ้ทุย'),
  Keyword(id: 'kw05', name: 'อินทูดิ'),
  Keyword(id: 'kw06', name: 'อั่นโหน้นนนนน'),
  Keyword(id: 'kw07', name: 'ไอร่อนแมน'),
  Keyword(id: 'kw08', name: 'บัคกี้'),
  Keyword(id: 'kw09', name: 'โตชิบ้า'),
  Keyword(id: 'kw10', name: 'แมคบุ้คโปร2019วิธทัชบาร์'),
  Keyword(id: 'kw11', name: 'กระดาษทิชชู่'),
  Keyword(id: 'kw12', name: 'ฮุ่ย ฮุ่ย ฮุ่ยฮุ่ย'),
  Keyword(id: 'kw13', name: 'ทำหน้าฟรี'),
  Keyword(id: 'kw14', name: 'แต่ลืมไปว่าสวยแล้ว'),
  Keyword(id: 'kw15', name: 'โคโรน่า'),
];

const List<Department> MOCK_DEPARTMENT = [
  Department(
    id: 'dep01',
    name: 'ผนงรจตกม',
    description: 'ผู้นำโง่เราจะตายกันหมด',
    url: 'https://www.google.com/',
    image: 'https://picsum.photos/201',
  ),
  Department(
    id: 'dep02',
    name: 'คะน้าหมูกรอบ',
    description:
        'เรื่องราวเกี่ยวกับพี่น้องสองคน',
    url: 'https://www.google.com/',
    image: 'https://picsum.photos/202',
  ),
  Department(
    id: 'dep03',
    name: 'กรมโรงงานอุตสาหกรรม',
    description:
        'น้องชายของลินคอล์นผู้เฉลียวฉลาดเป็นวิศวกรโครงสร้างชื่อ ไมเคิล ได้พยายามจะวางแผนช่วยพี่ชายของเขาหนีออกจากคุกทำการปล้นธนาคารเพื่อให้ได้จำคุก',
    url: 'https://www.google.com/',
    image: 'https://picsum.photos/203',
  ),
  Department(
    id: 'dep04',
    name: 'ปราสาทเก่าแก่ของเยอรมนี',
    description:
        'ที่คุกฟอกซ์ริเวอร์ที่เดียวกับพี่ชาย และเขาต้องร่วมมือกับนักโทษภายในคุกเพื่อจะช่วยพี่ชายของเขาออกมา',
    url: 'https://www.google.com/',
    image: 'https://picsum.photos/204',
  ),
];

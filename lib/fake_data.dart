import 'package:my_government/models/employee.dart';
import 'package:my_government/utils/fake_images.dart';

import 'models/news.dart';
import 'models/organisation.dart';

var topOrganisationList = [
  Organisation(
    id: 1,
    name: 'Ichki ishlar vazirligi',
    rating: 4,
    openCloseTime: '08:00 - 24:00',
    isLiked: true,
    ratingCount: 3132,
    address: "Farg'ona viloyati",
    image: FakeImages.ichkiIshlar,
  ),
  Organisation(
    id: 2,
    name: 'Qon quyish markazi',
    rating: 5,
    openCloseTime: '08:00 - 20:00',
    isLiked: false,
    ratingCount: 235,
    address: "Toshkent shahar",
    image: FakeImages.qonQuyish,
  )
];

var engYaxshiOrganisations = [
  Organisation(
    id: 3,
    name: 'Uzmobile ofis',
    rating: 4.8,
    openCloseTime: '08:00 - 19:00',
    isLiked: true,
    ratingCount: 235,
    address: "Farg’ona Viloyat, Marg’ilon\nShahar, Uvaysiy kochasi, 21-uy",
    image: FakeImages.uzmobile,
  ),
  Organisation(
    id: 4,
    name: 'Beeline ofis',
    rating: 4.8,
    openCloseTime: '08:00 - 18:00',
    isLiked: false,
    ratingCount: 235,
    address: "Farg’ona Viloyat, Marg’ilon\nShahar, Qo'shbuloq kochasi, 19-uy",
    image: FakeImages.beeline,
  )
];

var newsList = [
  News(
    'Yilning eng yaxshi deputati kim?',
    FakeImages.deputat,
  ),
  News(
    "John Blackning qing'ir ishlari negative sharhlar orqali aniqlandi",
    FakeImages.jonBlack,
  )
];

var rahbarlarList = [
  Employee('Fayzulloxon Muxtorov', "Bo'lim boshlig'i"),
  Employee('Jasurbek Umarov', "Boshlig' yordamchisi"),
  Employee("Umid Hakimov", "Jinoyat qidiruv boshlig'i"),
];

var ishchilarList = [
  Employee('Jahongir Sultonov', "Ishchi lavozimi"),
  Employee('Jahongir Sultonov', "Ishchi lavozimi"),
  Employee('Jahongir Sultonov', "Ishchi lavozimi"),
  Employee('Jahongir Sultonov', "Ishchi lavozimi"),
  Employee('Jahongir Sultonov', "Ishchi lavozimi"),
  Employee('Jahongir Sultonov', "Ishchi lavozimi"),
  Employee('Jahongir Sultonov', "Ishchi lavozimi"),
  Employee('Jahongir Sultonov', "Ishchi lavozimi"),
  Employee('Jahongir Sultonov', "Ishchi lavozimi"),
  Employee('Jahongir Sultonov', "Ishchi lavozimi"),
  Employee('Jahongir Sultonov', "Ishchi lavozimi"),
  Employee('Jahongir Sultonov', "Ishchi lavozimi"),
  Employee('Jahongir Sultonov', "Ishchi lavozimi"),
  Employee('Jahongir Sultonov', "Ishchi lavozimi"),
  Employee('Jahongir Sultonov', "Ishchi lavozimi"),
];

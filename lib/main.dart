import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MH Academy - ইসলামিক বাণী',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
        fontFamily: 'serif',
      ),
      home: const SplashPage(),
    );
  }
}

// ============================================================
// SPLASH SCREEN
// ============================================================
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _animController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeIn);
    _animController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HadithPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1B5E20), Color(0xFF388E3C), Color(0xFF1B5E20)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnim,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.15),
                    border: Border.all(color: Colors.white38, width: 2),
                  ),
                  child: const Center(
                    child: Text(
                      '☪',
                      style: TextStyle(fontSize: 64, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'ইসলামিক হাদিস ও বাণী',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 2,
                  width: 200,
                  color: Colors.white38,
                ),
                const SizedBox(height: 8),
                const Text(
                  'MH Academy',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFFFD54F),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Developed by Md. Monjurul Haque',
                  style: TextStyle(fontSize: 13, color: Colors.white60),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// HADITH DATA
// ============================================================
final List<Map<String, dynamic>> hadithList = [
  {
    "arabic": "إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ",
    "bangla": "নিশ্চয়ই সকল আমলের ফলাফল নিয়তের উপর নির্ভরশীল।",
    "source": "বুখারি ও মুসলিম",
    "category": "নিয়ত",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "الدِّينُ النَّصِيحَةُ",
    "bangla": "দ্বীন হলো নসিহত (কল্যাণকামিতা)।",
    "source": "মুসলিম",
    "category": "দ্বীন",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "خَيْرُكُمْ مَنْ تَعَلَّمَ الْقُرْآنَ وَعَلَّمَهُ",
    "bangla": "তোমাদের মধ্যে সেই ব্যক্তি সর্বোত্তম যে কুরআন শেখে এবং অপরকে শেখায়।",
    "source": "বুখারি",
    "category": "কুরআন",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "الْمُسْلِمُ مَنْ سَلِمَ الْمُسْلِمُونَ مِنْ لِسَانِهِ وَيَدِهِ",
    "bangla": "প্রকৃত মুসলিম সেই ব্যক্তি, যার জিহ্বা ও হাত থেকে অন্য মুসলিমরা নিরাপদ।",
    "source": "বুখারি ও মুসলিম",
    "category": "চরিত্র",
    "color": 0xFF43A047,
  },
  {
    "arabic": "لَا يُؤْمِنُ أَحَدُكُمْ حَتَّى يُحِبَّ لِأَخِيهِ مَا يُحِبُّ لِنَفْسِهِ",
    "bangla": "তোমাদের কেউ পূর্ণ মুমিন হবে না যতক্ষণ না সে তার ভাইয়ের জন্য তাই পছন্দ করে যা সে নিজের জন্য পছন্দ করে।",
    "source": "বুখারি ও মুসলিম",
    "category": "ঈমান",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "اتَّقِ اللَّهَ حَيْثُمَا كُنْتَ",
    "bangla": "তুমি যেখানেই থাকো, আল্লাহকে ভয় করো।",
    "source": "তিরমিযি",
    "category": "তাকওয়া",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "الطُّهُورُ شَطْرُ الْإِيمَانِ",
    "bangla": "পবিত্রতা ঈমানের অর্ধেক।",
    "source": "মুসলিম",
    "category": "পবিত্রতা",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "أَفْضَلُ الصَّلَاةِ بَعْدَ الْفَرِيضَةِ صَلَاةُ اللَّيْلِ",
    "bangla": "ফরজ নামাজের পর সর্বোত্তম নামাজ হলো রাতের (তাহাজ্জুদ) নামাজ।",
    "source": "মুসলিম",
    "category": "নামাজ",
    "color": 0xFF43A047,
  },
  {
    "arabic": "الصَّوْمُ جُنَّةٌ",
    "bangla": "রোজা হলো একটি ঢাল (পাপ ও জাহান্নাম থেকে রক্ষাকারী)।",
    "source": "বুখারি ও মুসলিম",
    "category": "রোজা",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "مَا نَقَصَتْ صَدَقَةٌ مِنْ مَالٍ",
    "bangla": "সাদকার কারণে কখনো সম্পদ কমে না।",
    "source": "মুসলিম",
    "category": "সাদকা",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "أَكْمَلُ الْمُؤْمِنِينَ إِيمَانًا أَحْسَنُهُمْ خُلُقًا",
    "bangla": "মুমিনদের মধ্যে সবচেয়ে পরিপূর্ণ ঈমানের অধিকারী সেই ব্যক্তি যার চরিত্র সবচেয়ে উত্তম।",
    "source": "তিরমিযি",
    "category": "চরিত্র",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "إِنَّ اللَّهَ يُحِبُّ إِذَا عَمِلَ أَحَدُكُمْ عَمَلًا أَنْ يُتْقِنَهُ",
    "bangla": "নিশ্চয়ই আল্লাহ পছন্দ করেন যখন তোমাদের কেউ কোনো কাজ করে সে যেন তা পরিপূর্ণভাবে সম্পন্ন করে।",
    "source": "বায়হাকি",
    "category": "কর্ম",
    "color": 0xFF43A047,
  },
  {
    "arabic": "الْكَلِمَةُ الطَّيِّبَةُ صَدَقَةٌ",
    "bangla": "ভালো কথা বলা সাদকা।",
    "source": "বুখারি ও মুসলিম",
    "category": "সাদকা",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "إِنَّمَا بُعِثْتُ لِأُتَمِّمَ مَكَارِمَ الْأَخْلَاقِ",
    "bangla": "আমি কেবল উত্তম চরিত্রের পরিপূর্ণতার জন্যই প্রেরিত হয়েছি।",
    "source": "বায়হাকি",
    "category": "চরিত্র",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "مَنْ كَانَ يُؤْمِنُ بِاللَّهِ وَالْيَوْمِ الْآخِرِ فَلْيَقُلْ خَيْرًا أَوْ لِيَصْمُتْ",
    "bangla": "যে ব্যক্তি আল্লাহ ও পরকালে বিশ্বাস রাখে, সে যেন ভালো কথা বলে অথবা চুপ থাকে।",
    "source": "বুখারি ও মুসলিম",
    "category": "বাক্য",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "لَا تَغْضَبْ",
    "bangla": "রাগ করো না।",
    "source": "বুখারি",
    "category": "চরিত্র",
    "color": 0xFF43A047,
  },
  {
    "arabic": "أَحَبُّ الْأَعْمَالِ إِلَى اللَّهِ أَدْوَمُهَا وَإِنْ قَلَّ",
    "bangla": "আল্লাহর কাছে সবচেয়ে প্রিয় আমল সেটি যা নিয়মিত করা হয়, যদিও তা পরিমাণে কম হয়।",
    "source": "বুখারি ও মুসলিম",
    "category": "ইবাদত",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "مَنْ صَلَّى عَلَيَّ صَلَاةً صَلَّى اللَّهُ عَلَيْهِ بِهَا عَشْرًا",
    "bangla": "যে ব্যক্তি আমার উপর একবার দরুদ পড়ে, আল্লাহ তার উপর দশবার রহমত নাজিল করেন।",
    "source": "মুসলিম",
    "category": "দরুদ",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "الْجَنَّةُ تَحْتَ أَقْدَامِ الْأُمَّهَاتِ",
    "bangla": "জান্নাত মায়েদের পায়ের তলায়।",
    "source": "নাসাঈ",
    "category": "পরিবার",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "لَيْسَ الشَّدِيدُ بِالصُّرَعَةِ إِنَّمَا الشَّدِيدُ الَّذِي يَمْلِكُ نَفْسَهُ عِنْدَ الْغَضَبِ",
    "bangla": "সত্যিকারের শক্তিশালী সে নয় যে কুস্তিতে জেতে; বরং সে যে রাগের সময় নিজেকে নিয়ন্ত্রণ করতে পারে।",
    "source": "বুখারি ও মুসলিম",
    "category": "চরিত্র",
    "color": 0xFF43A047,
  },
  {
    "arabic": "مَنْ غَشَّنَا فَلَيْسَ مِنَّا",
    "bangla": "যে আমাদের প্রতারণা করে সে আমাদের দলভুক্ত নয়।",
    "source": "মুসলিম",
    "category": "সততা",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "إِنَّ اللَّهَ رَفِيقٌ يُحِبُّ الرِّفْقَ",
    "bangla": "নিশ্চয়ই আল্লাহ কোমল এবং তিনি কোমলতাকে ভালোবাসেন।",
    "source": "বুখারি ও মুসলিম",
    "category": "কোমলতা",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "تَبَسُّمُكَ فِي وَجْهِ أَخِيكَ صَدَقَةٌ",
    "bangla": "তোমার ভাইয়ের মুখের দিকে হাসি দেওয়া সাদকা।",
    "source": "তিরমিযি",
    "category": "সাদকা",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "أَفْضَلُ الذِّكْرِ لَا إِلَهَ إِلَّا اللَّهُ",
    "bangla": "সর্বোত্তম জিকির হলো 'লা ইলাহা ইল্লাল্লাহ'।",
    "source": "তিরমিযি",
    "category": "জিকির",
    "color": 0xFF43A047,
  },
  {
    "arabic": "مَنْ كَانَ آخِرُ كَلَامِهِ لَا إِلَهَ إِلَّا اللَّهُ دَخَلَ الْجَنَّةَ",
    "bangla": "যার শেষ কথা হবে 'লা ইলাহা ইল্লাল্লাহ', সে জান্নাতে প্রবেশ করবে।",
    "source": "আবু দাউদ",
    "category": "জান্নাত",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "خَيْرُ النَّاسِ أَنْفَعُهُمْ لِلنَّاسِ",
    "bangla": "মানুষের মধ্যে সর্বোত্তম সেই ব্যক্তি যে মানুষের সবচেয়ে বেশি উপকার করে।",
    "source": "আল-মুজামুল আওসাত",
    "category": "সেবা",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "مَنْ لَا يَشْكُرِ النَّاسَ لَا يَشْكُرِ اللَّهَ",
    "bangla": "যে ব্যক্তি মানুষের প্রতি কৃতজ্ঞতা প্রকাশ করে না, সে আল্লাহর প্রতিও কৃতজ্ঞতা প্রকাশ করে না।",
    "source": "আবু দাউদ ও তিরমিযি",
    "category": "কৃতজ্ঞতা",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "اتَّقُوا النَّارَ وَلَوْ بِشِقِّ تَمْرَةٍ",
    "bangla": "জাহান্নাম থেকে বাঁচো, যদিও একটি খেজুরের অর্ধেক দিয়ে হয়।",
    "source": "বুখারি ও মুসলিম",
    "category": "দান",
    "color": 0xFF43A047,
  },
  {
    "arabic": "طَلَبُ الْعِلْمِ فَرِيضَةٌ عَلَى كُلِّ مُسْلِمٍ",
    "bangla": "জ্ঞান অর্জন করা প্রতিটি মুসলিমের উপর ফরজ।",
    "source": "ইবনে মাজাহ",
    "category": "জ্ঞান",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "الْعِلْمُ نُورٌ",
    "bangla": "জ্ঞান হলো আলো।",
    "source": "হাদিস গ্রন্থসমূহ",
    "category": "জ্ঞান",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "مَنْ خَرَجَ فِي طَلَبِ الْعِلْمِ فَهُوَ فِي سَبِيلِ اللَّهِ",
    "bangla": "যে ব্যক্তি জ্ঞান অর্জনের জন্য বের হয়, সে আল্লাহর পথে থাকে।",
    "source": "তিরমিযি",
    "category": "জ্ঞান",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "الصَّبْرُ نِصْفُ الْإِيمَانِ",
    "bangla": "সবর ঈমানের অর্ধেক।",
    "source": "বায়হাকি",
    "category": "ধৈর্য",
    "color": 0xFF43A047,
  },
  {
    "arabic": "مَا أَصَابَ الْمُسْلِمَ مِنْ نَصَبٍ وَلَا وَصَبٍ وَلَا هَمٍّ وَلَا حَزَنٍ إِلَّا كَفَّرَ اللَّهُ بِهَا",
    "bangla": "কোনো মুসলিমকে যে ক্লান্তি, রোগ, দুশ্চিন্তা বা দুঃখ স্পর্শ করে — এমনকি কোনো কাঁটা ফোটা — আল্লাহ তার দ্বারা তার গুনাহ মাফ করে দেন।",
    "source": "বুখারি ও মুসলিম",
    "category": "ধৈর্য",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "إِنَّ مَعَ الْعُسْرِ يُسْرًا",
    "bangla": "নিশ্চয়ই কষ্টের সাথেই সহজ আসে।",
    "source": "আল-কুরআন ৯৪:৬",
    "category": "আশা",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "تَوَاضَعُوا لِمَنْ تُعَلِّمُونَهُ الْعِلْمَ",
    "bangla": "যাকে জ্ঞান শেখাও তার প্রতি বিনয়ী হও।",
    "source": "তাবারানি",
    "category": "জ্ঞান",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "مَنْ سَلَكَ طَرِيقًا يَلْتَمِسُ فِيهِ عِلْمًا سَهَّلَ اللَّهُ لَهُ طَرِيقًا إِلَى الْجَنَّةِ",
    "bangla": "যে ব্যক্তি জ্ঞান অন্বেষণে পথ চলে, আল্লাহ তার জন্য জান্নাতের পথ সহজ করে দেন।",
    "source": "মুসলিম",
    "category": "জ্ঞান",
    "color": 0xFF43A047,
  },
  {
    "arabic": "لَا حَسَدَ إِلَّا فِي اثْنَتَيْنِ",
    "bangla": "কেবল দুটি বিষয়ে ঈর্ষা করা জায়েজ: এমন ব্যক্তি যাকে আল্লাহ সম্পদ দিয়েছেন এবং সে তা সৎপথে ব্যয় করে; এবং এমন ব্যক্তি যাকে আল্লাহ জ্ঞান দিয়েছেন এবং সে তা দিয়ে বিচার করে ও শেখায়।",
    "source": "বুখারি ও মুসলিম",
    "category": "জ্ঞান",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "كُلُّ مَعْرُوفٍ صَدَقَةٌ",
    "bangla": "প্রতিটি ভালো কাজ সাদকা।",
    "source": "বুখারি ও মুসলিম",
    "category": "সাদকা",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "مَنْ لَا يَرْحَمِ النَّاسَ لَا يَرْحَمُهُ اللَّهُ",
    "bangla": "যে মানুষের প্রতি দয়া করে না, আল্লাহ তার প্রতি দয়া করেন না।",
    "source": "বুখারি ও মুসলিম",
    "category": "দয়া",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "الرَّاحِمُونَ يَرْحَمُهُمُ الرَّحْمَنُ",
    "bangla": "দয়াশীলদের উপর দয়াময় আল্লাহ দয়া করেন।",
    "source": "আবু দাউদ ও তিরমিযি",
    "category": "দয়া",
    "color": 0xFF43A047,
  },
  {
    "arabic": "خَيْرُكُمْ خَيْرُكُمْ لِأَهْلِهِ",
    "bangla": "তোমাদের মধ্যে সর্বোত্তম সেই ব্যক্তি যে তার পরিবারের জন্য সর্বোত্তম।",
    "source": "তিরমিযি",
    "category": "পরিবার",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "إِكْرَامُ الضَّيْفِ مِنَ الْإِيمَانِ",
    "bangla": "মেহমানকে সম্মান করা ঈমানের অংশ।",
    "source": "বুখারি ও মুসলিম",
    "category": "আদব",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "لَا يَشْكُرُ اللَّهَ مَنْ لَا يَشْكُرُ النَّاسَ",
    "bangla": "যে মানুষের কৃতজ্ঞতা জানায় না, সে আল্লাহরও কৃতজ্ঞতা জানায় না।",
    "source": "তিরমিযি",
    "category": "কৃতজ্ঞতা",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "أَقْرَبُ مَا يَكُونُ الْعَبْدُ مِنْ رَبِّهِ وَهُوَ سَاجِدٌ",
    "bangla": "বান্দা তার রবের সবচেয়ে কাছে থাকে যখন সে সিজদায় থাকে।",
    "source": "মুসলিম",
    "category": "নামাজ",
    "color": 0xFF43A047,
  },
  {
    "arabic": "أَفْضَلُ الصِّيَامِ بَعْدَ رَمَضَانَ شَهْرُ اللَّهِ الْمُحَرَّمُ",
    "bangla": "রমজানের পরে সর্বোত্তম রোজা হলো আল্লাহর মাস মুহররমে রোজা রাখা।",
    "source": "মুসলিম",
    "category": "রোজা",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "إِذَا مَاتَ الْإِنْسَانُ انْقَطَعَ عَنْهُ عَمَلُهُ إِلَّا مِنْ ثَلَاثَةٍ",
    "bangla": "মানুষ মারা গেলে তার আমল বন্ধ হয়ে যায়, তিনটি ছাড়া: সাদকায়ে জারিয়া, উপকারী জ্ঞান এবং নেক সন্তান যে তার জন্য দোয়া করে।",
    "source": "মুসলিম",
    "category": "আমল",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "بَلِّغُوا عَنِّي وَلَوْ آيَةً",
    "bangla": "আমার পক্ষ থেকে পৌঁছে দাও, যদিও একটি আয়াত হয়।",
    "source": "বুখারি",
    "category": "দাওয়াত",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "إِنَّ اللَّهَ لَا يَنْظُرُ إِلَى صُوَرِكُمْ وَأَمْوَالِكُمْ وَلَكِنْ يَنْظُرُ إِلَى قُلُوبِكُمْ وَأَعْمَالِكُمْ",
    "bangla": "আল্লাহ তোমাদের চেহারা ও সম্পদের দিকে তাকান না, বরং তিনি তোমাদের হৃদয় ও কর্মের দিকে তাকান।",
    "source": "মুসলিম",
    "category": "অন্তর",
    "color": 0xFF43A047,
  },
  {
    "arabic": "مَنْ أَحَبَّ لِقَاءَ اللَّهِ أَحَبَّ اللَّهُ لِقَاءَهُ",
    "bangla": "যে আল্লাহর সাথে সাক্ষাৎ পছন্দ করে, আল্লাহও তার সাথে সাক্ষাৎ পছন্দ করেন।",
    "source": "বুখারি ও মুসলিম",
    "category": "আখিরাত",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "صِلُوا أَرْحَامَكُمْ",
    "bangla": "তোমাদের আত্মীয়দের সাথে সম্পর্ক বজায় রাখো।",
    "source": "বুখারি",
    "category": "আত্মীয়তা",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "حُسْنُ الظَّنِّ مِنْ حُسْنِ الْعِبَادَةِ",
    "bangla": "সুধারণা রাখা উত্তম ইবাদতের অংশ।",
    "source": "আবু দাউদ",
    "category": "চরিত্র",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "مَنْ أَحَبَّ أَنْ يُبْسَطَ لَهُ فِي رِزْقِهِ وَيُنْسَأَ لَهُ فِي أَثَرِهِ فَلْيَصِلْ رَحِمَهُ",
    "bangla": "যে চায় তার রিজিক প্রশস্ত হোক এবং আয়ু বৃদ্ধি পাক, সে যেন আত্মীয়তার বন্ধন বজায় রাখে।",
    "source": "বুখারি ও মুসলিম",
    "category": "আত্মীয়তা",
    "color": 0xFF43A047,
  },
  {
    "arabic": "كُنْ فِي الدُّنْيَا كَأَنَّكَ غَرِيبٌ أَوْ عَابِرُ سَبِيلٍ",
    "bangla": "দুনিয়ায় এমনভাবে থাকো যেন তুমি একজন পথিক বা অপরিচিত।",
    "source": "বুখারি",
    "category": "দুনিয়া",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "اعْبُدِ اللَّهَ كَأَنَّكَ تَرَاهُ",
    "bangla": "আল্লাহর ইবাদত করো যেন তুমি তাঁকে দেখছ।",
    "source": "বুখারি ও মুসলিম",
    "category": "ইহসান",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "إِذَا اسْتَيْقَظَ أَحَدُكُمْ مِنَ اللَّيْلِ فَلْيَقُلِ الْحَمْدُ لِلَّهِ",
    "bangla": "যখন তোমাদের কেউ রাতে জেগে ওঠে, সে যেন 'আলহামদুলিল্লাহ' বলে।",
    "source": "তিরমিযি",
    "category": "জিকির",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "السَّخِيُّ قَرِيبٌ مِنَ اللَّهِ",
    "bangla": "উদার ব্যক্তি আল্লাহর কাছাকাছি।",
    "source": "তিরমিযি",
    "category": "দান",
    "color": 0xFF43A047,
  },
  {
    "arabic": "الْبَخِيلُ بَعِيدٌ مِنَ اللَّهِ",
    "bangla": "কৃপণ ব্যক্তি আল্লাহ থেকে দূরে।",
    "source": "তিরমিযি",
    "category": "দান",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "مَثَلُ الْمُؤْمِنِينَ فِي تَوَادِّهِمْ كَمَثَلِ الْجَسَدِ الْوَاحِدِ",
    "bangla": "পরস্পরের প্রতি ভালোবাসায় মুমিনদের উদাহরণ হলো একটি দেহের মতো।",
    "source": "বুখারি ও মুসলিম",
    "category": "ভ্রাতৃত্ব",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "لَا تَحَاسَدُوا وَلَا تَنَاجَشُوا وَلَا تَبَاغَضُوا",
    "bangla": "পরস্পর হিংসা করো না, প্রতারণা করো না এবং বিদ্বেষ পোষণ করো না।",
    "source": "মুসলিম",
    "category": "ভ্রাতৃত্ব",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "أَنْتُمْ إِخْوَةٌ",
    "bangla": "তোমরা (মুসলিমরা) পরস্পর ভাই।",
    "source": "বুখারি ও মুসলিম",
    "category": "ভ্রাতৃত্ব",
    "color": 0xFF43A047,
  },
  {
    "arabic": "اُنْصُرْ أَخَاكَ ظَالِمًا أَوْ مَظْلُومًا",
    "bangla": "তোমার ভাইকে সাহায্য করো, সে অত্যাচারী হোক বা অত্যাচারিত হোক।",
    "source": "বুখারি",
    "category": "ভ্রাতৃত্ব",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "تُعِينُ الرَّجُلَ فِي دَابَّتِهِ فَتَحْمِلُهُ عَلَيْهَا أَوْ تَرْفَعُ لَهُ عَلَيْهَا مَتَاعَهُ صَدَقَةٌ",
    "bangla": "কাউকে তার বাহনে উঠতে সাহায্য করা বা তার মালপত্র তুলে দেওয়াও সাদকা।",
    "source": "বুখারি ও মুসলিম",
    "category": "সাদকা",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "أَحَبُّ النَّاسِ إِلَى اللَّهِ أَنْفَعُهُمْ لِلنَّاسِ",
    "bangla": "আল্লাহর কাছে সবচেয়ে প্রিয় মানুষ সে যে মানুষের সবচেয়ে বেশি উপকার করে।",
    "source": "তাবারানি",
    "category": "সেবা",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "الْحَيَاءُ مِنَ الْإِيمَانِ",
    "bangla": "লজ্জাশীলতা ঈমানের অংশ।",
    "source": "বুখারি ও মুসলিম",
    "category": "লজ্জা",
    "color": 0xFF43A047,
  },
  {
    "arabic": "إِذَا لَمْ تَسْتَحِ فَاصْنَعْ مَا شِئْتَ",
    "bangla": "যদি তোমার লজ্জা না থাকে, তাহলে যা ইচ্ছা তাই করো।",
    "source": "বুখারি",
    "category": "লজ্জা",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "مَا مَلَأَ آدَمِيٌّ وِعَاءً شَرًّا مِنْ بَطْنٍ",
    "bangla": "মানুষ তার পেটের চেয়ে খারাপ কোনো পাত্র পূর্ণ করেনি।",
    "source": "তিরমিযি ও ইবনে মাজাহ",
    "category": "স্বাস্থ্য",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ",
    "bangla": "হে আল্লাহ! আমি তোমার কাছে ক্ষমা ও সুস্থতা চাই।",
    "source": "আবু দাউদ ও তিরমিযি",
    "category": "দোয়া",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "التَّوْبَةُ تَجُبُّ مَا قَبْلَهَا",
    "bangla": "তওবা পূর্ববর্তী সব গুনাহ মুছে দেয়।",
    "source": "মুসলিম",
    "category": "তওবা",
    "color": 0xFF43A047,
  },
  {
    "arabic": "كُلُّ ابْنِ آدَمَ خَطَّاءٌ وَخَيْرُ الْخَطَّائِينَ التَّوَّابُونَ",
    "bangla": "প্রতিটি আদম সন্তানই ভুল করে, আর ভুলকারীদের মধ্যে সর্বোত্তম হলো যারা তওবা করে।",
    "source": "তিরমিযি ও ইবনে মাজাহ",
    "category": "তওবা",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "قُلِ اللَّهُمَّ مَالِكَ الْمُلْكِ",
    "bangla": "বলো: হে আল্লাহ! সমস্ত রাজত্বের মালিক।",
    "source": "আল-কুরআন ৩:২৬",
    "category": "দোয়া",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "ادْعُوا اللَّهَ وَأَنْتُمْ مُوقِنُونَ بِالْإِجَابَةِ",
    "bangla": "আল্লাহর কাছে দোয়া করো এই বিশ্বাস রেখে যে তিনি কবুল করবেন।",
    "source": "তিরমিযি",
    "category": "দোয়া",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "الدُّعَاءُ مُخُّ الْعِبَادَةِ",
    "bangla": "দোয়া হলো ইবাদতের মজ্জা।",
    "source": "তিরমিযি",
    "category": "দোয়া",
    "color": 0xFF43A047,
  },
  {
    "arabic": "مَا تَوَاضَعَ أَحَدٌ لِلَّهِ إِلَّا رَفَعَهُ اللَّهُ",
    "bangla": "কেউ আল্লাহর জন্য বিনয়ী হলে আল্লাহ তাকে উন্নত করেন।",
    "source": "মুসলিম",
    "category": "বিনয়",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "مَنْ تَوَاضَعَ لِلَّهِ رَفَعَهُ اللَّهُ",
    "bangla": "যে আল্লাহর জন্য বিনম্র হয়, আল্লাহ তাকে মর্যাদা দেন।",
    "source": "ইবনে মাজাহ",
    "category": "বিনয়",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "الصِّدْقُ يَهْدِي إِلَى الْبِرِّ وَالْبِرُّ يَهْدِي إِلَى الْجَنَّةِ",
    "bangla": "সত্যবাদিতা নেকির দিকে নিয়ে যায়, আর নেকি জান্নাতের দিকে নিয়ে যায়।",
    "source": "বুখারি ও মুসলিম",
    "category": "সততা",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "الْكَذِبُ يَهْدِي إِلَى الْفُجُورِ وَالْفُجُورُ يَهْدِي إِلَى النَّارِ",
    "bangla": "মিথ্যা পাপাচারের দিকে নিয়ে যায়, আর পাপাচার জাহান্নামের দিকে নিয়ে যায়।",
    "source": "বুখারি ও মুসলিম",
    "category": "সততা",
    "color": 0xFF43A047,
  },
  {
    "arabic": "إِيَّاكُمْ وَالظَّنَّ فَإِنَّ الظَّنَّ أَكْذَبُ الْحَدِيثِ",
    "bangla": "কুধারণা থেকে বিরত থাকো, কারণ কুধারণা হলো সবচেয়ে মিথ্যা কথা।",
    "source": "বুখারি ও মুসলিম",
    "category": "চরিত্র",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "لَا تَجَسَّسُوا",
    "bangla": "গুপ্তচরবৃত্তি করো না।",
    "source": "বুখারি ও মুসলিম",
    "category": "চরিত্র",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "لَا تَغْتَابُوا",
    "bangla": "গীবত করো না।",
    "source": "বুখারি ও মুসলিম",
    "category": "চরিত্র",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "فِي كُلِّ كَبِدٍ رَطْبَةٍ أَجْرٌ",
    "bangla": "প্রতিটি জীবন্ত প্রাণীকে পানি পান করানোতেও পুণ্য আছে।",
    "source": "বুখারি ও মুসলিম",
    "category": "দয়া",
    "color": 0xFF43A047,
  },
  {
    "arabic": "إِنَّ اللَّهَ جَمِيلٌ يُحِبُّ الْجَمَالَ",
    "bangla": "নিশ্চয়ই আল্লাহ সুন্দর এবং তিনি সৌন্দর্যকে ভালোবাসেন।",
    "source": "মুসলিম",
    "category": "সৌন্দর্য",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "النَّظَافَةُ مِنَ الْإِيمَانِ",
    "bangla": "পরিষ্কার-পরিচ্ছন্নতা ঈমানের অংশ।",
    "source": "হাদিস গ্রন্থসমূহ",
    "category": "পবিত্রতা",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "أَكْثِرُوا ذِكْرَ اللَّهِ",
    "bangla": "আল্লাহর জিকির বেশি বেশি করো।",
    "source": "আহমাদ",
    "category": "জিকির",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "مَنْ قَرَأَ آيَةَ الْكُرْسِيِّ دُبُرَ كُلِّ صَلَاةٍ مَكْتُوبَةٍ لَمْ يَمْنَعْهُ مِنْ دُخُولِ الْجَنَّةِ إِلَّا الْمَوْتُ",
    "bangla": "যে ব্যক্তি প্রতিটি ফরজ নামাজের পর আয়াতুল কুরসি পড়ে, তার জান্নাতে প্রবেশে মৃত্যু ছাড়া কোনো বাধা নেই।",
    "source": "নাসাঈ",
    "category": "কুরআন",
    "color": 0xFF43A047,
  },
  {
    "arabic": "الْمُؤْمِنُ لِلْمُؤْمِنِ كَالْبُنْيَانِ يَشُدُّ بَعْضُهُ بَعْضًا",
    "bangla": "মুমিন মুমিনের জন্য একটি প্রাচীরের মতো যার এক অংশ অন্য অংশকে শক্তিশালী করে।",
    "source": "বুখারি ও মুসলিম",
    "category": "ভ্রাতৃত্ব",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "مَنْ سَتَرَ مُسْلِمًا سَتَرَهُ اللَّهُ فِي الدُّنْيَا وَالْآخِرَةِ",
    "bangla": "যে কোনো মুসলিমের দোষ ঢেকে রাখে, আল্লাহ দুনিয়া ও আখিরাতে তার দোষ ঢেকে রাখেন।",
    "source": "মুসলিম",
    "category": "ভ্রাতৃত্ব",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "وَمَنْ يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ",
    "bangla": "যে আল্লাহর উপর ভরসা করে, আল্লাহই তার জন্য যথেষ্ট।",
    "source": "আল-কুরআন ৬৫:৩",
    "category": "তাওয়াক্কুল",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "لَوْ تَوَكَّلْتُمْ عَلَى اللَّهِ حَقَّ تَوَكُّلِهِ لَرَزَقَكُمْ كَمَا يَرْزُقُ الطَّيْرَ",
    "bangla": "যদি তোমরা যথাযথভাবে আল্লাহর উপর ভরসা রাখতে, তিনি তোমাদের রিজিক দিতেন যেভাবে পাখিদের দেন।",
    "source": "তিরমিযি",
    "category": "তাওয়াক্কুল",
    "color": 0xFF43A047,
  },
  {
    "arabic": "مَنْ يُرِدِ اللَّهُ بِهِ خَيْرًا يُفَقِّهْهُ فِي الدِّينِ",
    "bangla": "আল্লাহ যার ভালো চান, তাকে দ্বীনের জ্ঞান দান করেন।",
    "source": "বুখারি ও মুসলিম",
    "category": "জ্ঞান",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "الْإِيمَانُ بِضْعٌ وَسَبْعُونَ شُعْبَةً",
    "bangla": "ঈমানের সত্তরটিরও বেশি শাখা রয়েছে।",
    "source": "বুখারি ও মুসলিম",
    "category": "ঈমান",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "أَعْلَاهَا قَوْلُ لَا إِلَهَ إِلَّا اللَّهُ وَأَدْنَاهَا إِمَاطَةُ الْأَذَى عَنِ الطَّرِيقِ",
    "bangla": "তার সর্বোচ্চ হলো 'লা ইলাহা ইল্লাল্লাহ' বলা এবং সর্বনিম্ন হলো রাস্তা থেকে কষ্টদায়ক বস্তু সরানো।",
    "source": "বুখারি ও মুসলিম",
    "category": "ঈমান",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "اسْتَعِنْ بِاللَّهِ وَلَا تَعْجَزْ",
    "bangla": "আল্লাহর সাহায্য নাও এবং অক্ষম হয়ে পড়ো না।",
    "source": "মুসলিম",
    "category": "তাওয়াক্কুল",
    "color": 0xFF43A047,
  },
  {
    "arabic": "إِذَا سَأَلْتَ فَاسْأَلِ اللَّهَ",
    "bangla": "যখন চাইবে, আল্লাহর কাছে চাও।",
    "source": "তিরমিযি",
    "category": "দোয়া",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "وَإِذَا اسْتَعَنْتَ فَاسْتَعِنْ بِاللَّهِ",
    "bangla": "যখন সাহায্য চাইবে, আল্লাহর কাছে সাহায্য চাও।",
    "source": "তিরমিযি",
    "category": "তাওয়াক্কুল",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "الدُّنْيَا سِجْنُ الْمُؤْمِنِ وَجَنَّةُ الْكَافِرِ",
    "bangla": "দুনিয়া হলো মুমিনের কারাগার এবং কাফিরের জান্নাত।",
    "source": "মুসলিম",
    "category": "দুনিয়া",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "مَا قَلَّ وَكَفَى خَيْرٌ مِمَّا كَثُرَ وَأَلْهَى",
    "bangla": "যা কম কিন্তু যথেষ্ট, তা তার চেয়ে ভালো যা বেশি কিন্তু গাফলতে ফেলে।",
    "source": "হাকিম",
    "category": "দুনিয়া",
    "color": 0xFF43A047,
  },
  {
    "arabic": "حُبُّ الدُّنْيَا رَأْسُ كُلِّ خَطِيئَةٍ",
    "bangla": "দুনিয়ার প্রতি মোহ সব পাপের মূল।",
    "source": "বায়হাকি",
    "category": "দুনিয়া",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "ابْدَأْ بِنَفْسِكَ",
    "bangla": "নিজ থেকে শুরু করো।",
    "source": "মুসলিম",
    "category": "দান",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "إِنَّ اللَّهَ يُحِبُّ أَنْ تُؤْتَى رُخَصُهُ",
    "bangla": "নিশ্চয়ই আল্লাহ ভালোবাসেন যে তাঁর সুযোগ-সুবিধা গ্রহণ করা হোক।",
    "source": "আহমাদ",
    "category": "দ্বীন",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "يَسِّرُوا وَلَا تُعَسِّرُوا",
    "bangla": "সহজ করো, কঠিন করো না।",
    "source": "বুখারি ও মুসলিম",
    "category": "দ্বীন",
    "color": 0xFF43A047,
  },
  {
    "arabic": "بَشِّرُوا وَلَا تُنَفِّرُوا",
    "bangla": "সুসংবাদ দাও, ভয় দেখিয়ে বিতাড়িত করো না।",
    "source": "বুখারি ও মুসলিম",
    "category": "দাওয়াত",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "هَلَكَ الْمُتَنَطِّعُونَ",
    "bangla": "অতিরিক্ত কঠোরতা অবলম্বনকারীরা ধ্বংস হয়ে গেছে।",
    "source": "মুসলিম",
    "category": "দ্বীন",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "إِنَّ الدِّينَ يُسْرٌ",
    "bangla": "নিশ্চয়ই দ্বীন সহজ।",
    "source": "বুখারি",
    "category": "দ্বীন",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "لَا ضَرَرَ وَلَا ضِرَارَ",
    "bangla": "নিজের ক্ষতি করো না এবং অপরের ক্ষতি করো না।",
    "source": "ইবনে মাজাহ",
    "category": "ন্যায়",
    "color": 0xFF43A047,
  },
  {
    "arabic": "إِنَّ مِنْ أَكْبَرِ الْكَبَائِرِ أَنْ يَلْعَنَ الرَّجُلُ وَالِدَيْهِ",
    "bangla": "সবচেয়ে বড় কবিরা গুনাহগুলোর মধ্যে একটি হলো নিজের পিতামাতাকে অভিশাপ দেওয়া।",
    "source": "বুখারি ও মুসলিম",
    "category": "পরিবার",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "رِضَا الرَّبِّ فِي رِضَا الْوَالِدَيْنِ",
    "bangla": "আল্লাহর সন্তুষ্টি পিতামাতার সন্তুষ্টিতে নিহিত।",
    "source": "তিরমিযি",
    "category": "পরিবার",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "أَطِعِ اللَّهَ وَأَطِعِ الرَّسُولَ",
    "bangla": "আল্লাহর আনুগত্য করো এবং রাসুলের আনুগত্য করো।",
    "source": "আল-কুরআন ৪:৫৯",
    "category": "আনুগত্য",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "مَنْ أَحَبَّ سُنَّتِي فَقَدْ أَحَبَّنِي",
    "bangla": "যে আমার সুন্নাহকে ভালোবাসে, সে আমাকে ভালোবাসে।",
    "source": "তিরমিযি",
    "category": "সুন্নাহ",
    "color": 0xFF43A047,
  },
  {
    "arabic": "وَمَنْ أَحَبَّنِي كَانَ مَعِي فِي الْجَنَّةِ",
    "bangla": "যে আমাকে ভালোবাসে, সে জান্নাতে আমার সাথে থাকবে।",
    "source": "তিরমিযি",
    "category": "জান্নাত",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "حُبُّكَ الشَّيْءَ يُعْمِي وَيُصِمُّ",
    "bangla": "কোনো কিছুর অতিরিক্ত ভালোবাসা মানুষকে অন্ধ ও বধির করে দেয়।",
    "source": "আবু দাউদ",
    "category": "চরিত্র",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "قُلِ اللَّهُمَّ اغْفِرْ لِي وَارْحَمْنِي",
    "bangla": "বলো: হে আল্লাহ! আমাকে ক্ষমা করুন এবং আমার উপর রহম করুন।",
    "source": "তিরমিযি",
    "category": "দোয়া",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
    "bangla": "আল্লাহ পবিত্র এবং সব প্রশংসা তাঁর — এই কথাটি আমলনামায় ভারী।",
    "source": "বুখারি ও মুসলিম",
    "category": "জিকির",
    "color": 0xFF43A047,
  },
  {
    "arabic": "مَنْ قَالَ سُبْحَانَ اللَّهِ وَبِحَمْدِهِ فِي يَوْمٍ مِائَةَ مَرَّةٍ",
    "bangla": "যে ব্যক্তি দিনে ১০০ বার 'সুবহানাল্লাহি ওয়া বিহামদিহি' বলে, তার গুনাহ মাফ হয়ে যায়।",
    "source": "বুখারি ও মুসলিম",
    "category": "জিকির",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "اللَّهُ أَكْبَرُ",
    "bangla": "আল্লাহ সর্বমহান — এই কথাটি সমস্ত কিছু থেকে আল্লাহকে বড় মনে করার ঘোষণা।",
    "source": "আল-কুরআন",
    "category": "জিকির",
    "color": 0xFF2E7D32,
  },
  {
    "arabic": "إِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ",
    "bangla": "নিশ্চয়ই আমরা আল্লাহর জন্য এবং নিশ্চয়ই আমরা তাঁর কাছেই ফিরে যাবো।",
    "source": "আল-কুরআন ২:১৫৬",
    "category": "ধৈর্য",
    "color": 0xFF388E3C,
  },
  {
    "arabic": "مَنْ كَظَمَ غَيْظًا وَهُوَ قَادِرٌ عَلَى أَنْ يُنَفِّذَهُ دَعَاهُ اللَّهُ عَلَى رُءُوسِ الْخَلَائِقِ",
    "bangla": "যে ব্যক্তি রাগ থাকা সত্ত্বেও ক্ষমা করে, আল্লাহ তাকে সমগ্র সৃষ্টির সামনে ডাকবেন।",
    "source": "আবু দাউদ ও তিরমিযি",
    "category": "ক্ষমা",
    "color": 0xFF43A047,
  },
  {
    "arabic": "الْعَفْوُ لَا يَزِيدُ الْعَبْدَ إِلَّا عِزًّا",
    "bangla": "ক্ষমা করা বান্দার সম্মান কেবল বাড়ায়।",
    "source": "মুসলিম",
    "category": "ক্ষমা",
    "color": 0xFF1B5E20,
  },
  {
    "arabic": "أَلَا أُنَبِّئُكُمْ بِأَفْضَلَ مِنْ دَرَجَةِ الصِّيَامِ وَالصَّلَاةِ وَالصَّدَقَةِ",
    "bangla": "আমি কি তোমাদের রোজা, নামাজ ও সাদকার চেয়েও উত্তম আমলের কথা বলবো? তা হলো মানুষের মধ্যে সম্পর্ক ঠিক করে দেওয়া।",
    "source": "আবু দাউদ ও তিরমিযি",
    "category": "সম্পর্ক",
    "color": 0xFF2E7D32,
  },
];

// ============================================================
// HADITH PAGE
// ============================================================
class HadithPage extends StatefulWidget {
  const HadithPage({super.key});

  @override
  State<HadithPage> createState() => _HadithPageState();
}

class _HadithPageState extends State<HadithPage>
    with TickerProviderStateMixin {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  late AnimationController _animController;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _animController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _scaleAnim = Tween<double>(begin: 0.92, end: 1.0).animate(
        CurvedAnimation(parent: _animController, curve: Curves.easeOut));
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
    _animController.reset();
    _animController.forward();
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://mh-academy-86f76.web.app');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('লিংক খোলা যাচ্ছে না')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: hadithList.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              final item = hadithList[index];
              final bgColor = Color(item['color'] as int);
              return _buildPage(item, bgColor, index);
            },
          ),
          // Top Info Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black26,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'MH Academy',
                            style: TextStyle(
                              color: Color(0xFFFFD54F),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            'ইসলামিক হাদিস ও বাণী',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white20,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${_currentIndex + 1} / ${hadithList.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(Map<String, dynamic> item, Color bgColor, int index) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            bgColor,
            Color.lerp(bgColor, Colors.black, 0.4)!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ScaleTransition(
        scale: _scaleAnim,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 70, 24, 24),
            child: Column(
              children: [
                // Decorative top ornament
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 1,
                        width: 60,
                        color: Colors.white30),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('✦',
                          style:
                              TextStyle(color: Color(0xFFFFD54F), fontSize: 18)),
                    ),
                    Container(
                        height: 1,
                        width: 60,
                        color: Colors.white30),
                  ],
                ),
                const SizedBox(height: 16),

                // Category badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white20,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white38),
                  ),
                  child: Text(
                    item['category'] as String,
                    style: const TextStyle(
                      color: Color(0xFFFFD54F),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Arabic text
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Text(
                    item['arabic'] as String,
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.8,
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(height: 24),

                // Bangla translation
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white30),
                  ),
                  child: Text(
                    item['bangla'] as String,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      height: 1.7,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),

                // Source
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.menu_book_rounded,
                        color: Color(0xFFFFD54F), size: 16),
                    const SizedBox(width: 6),
                    Text(
                      'সূত্র: ${item['source']}',
                      style: const TextStyle(
                        color: Color(0xFFFFD54F),
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),

                // বিস্তারিত Button
                GestureDetector(
                  onTap: _launchURL,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 13),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.25),
                          Colors.white.withOpacity(0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white60, width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.language, color: Colors.white, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'বিস্তারিত জানুন',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.white70, size: 13),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                // Navigation buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (index > 0)
                      _navButton(
                        icon: Icons.arrow_back_ios_new,
                        label: 'পূর্ববর্তী',
                        onTap: () => _controller.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        ),
                      )
                    else
                      const SizedBox(width: 100),
                    // Dots
                    Row(
                      children: List.generate(
                        5,
                        (i) {
                          final offset = _currentIndex - 2 + i;
                          if (offset < 0 ||
                              offset >= hadithList.length) {
                            return const SizedBox(width: 8);
                          }
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            width: offset == _currentIndex ? 12 : 6,
                            height: offset == _currentIndex ? 12 : 6,
                            decoration: BoxDecoration(
                              color: offset == _currentIndex
                                  ? Colors.white
                                  : Colors.white38,
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      ),
                    ),
                    if (index < hadithList.length - 1)
                      _navButton(
                        icon: Icons.arrow_forward_ios,
                        label: 'পরবর্তী',
                        iconFirst: false,
                        onTap: () => _controller.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        ),
                      )
                    else
                      _navButton(
                        icon: Icons.refresh,
                        label: 'শুরুতে',
                        onTap: () => _controller.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeInOut,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),

                // Footer
                Text(
                  'Developed by Md. Monjurul Haque',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.35),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool iconFirst = true,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white15,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: iconFirst
              ? [
                  Icon(icon, color: Colors.white70, size: 14),
                  const SizedBox(width: 5),
                  Text(label,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 13)),
                ]
              : [
                  Text(label,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 13)),
                  const SizedBox(width: 5),
                  Icon(icon, color: Colors.white70, size: 14),
                ],
        ),
      ),
    );
  }
}

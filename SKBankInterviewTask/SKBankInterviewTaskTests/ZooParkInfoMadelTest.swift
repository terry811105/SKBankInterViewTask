//
//  ZooParkInfoMadelTest.swift
//  SKBankInterviewTaskTests
//
//  Created by 張文煥 on 2023/6/16.
//

import XCTest

final class ZooParkInfoMadelTest: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testZooParkInfo() {
        let json = getResultJsonString()
        let data = json.data(using: .utf8)!
        let result = try? JSONDecoder().decode(GetZooParkInfoResponse.self, from: data)

        XCTAssertEqual(result?.result.results.count, 16)
        XCTAssertEqual(result?.result.results[0].id, 1)
        XCTAssertEqual(result?.result.results[0].category, "戶外區")
        XCTAssertEqual(result?.result.results[0].name, "臺灣動物區")
        XCTAssertEqual(result?.result.results[15].name, "酷Cool節能屋")
        
    }
    
    
    
    
    
    
    func getResultJsonString() -> String {
        let resultJson = #"""
        {
            "result": {
                "limit": 20,
                "offset": 0,
                "count": 16,
                "sort": "",
                "results": [
                    {
                        "_id": 1,
                        "_importdate": {
                            "date": "2022-05-09 14:47:38.971190",
                            "timezone_type": 3,
                            "timezone": "Asia/Taipei"
                        },
                        "e_no": "1",
                        "e_category": "戶外區",
                        "e_name": "臺灣動物區",
                        "e_pic_url": "http://www.zoo.gov.tw/iTAP/05_Exhibit/01_FormosanAnimal.jpg",
                        "e_info": "臺灣位於北半球，北迴歸線橫越南部，造成亞熱帶溫和多雨的氣候。又因高山急流、起伏多樣的地形，因而在這蕞爾小島上，形成了多樣性的生態系，孕育了多種不同生態習性的動、植物，豐富的生物物種共存共榮於此，也使臺灣博得美麗之島「福爾摩沙」的美名。臺灣動物區以臺灣原生動物與棲息環境為展示重點，佈置模擬動物原生棲地之生態環境，讓動物表現如野外般自然的生活習性，引導民眾更正確地認識本土野生動物，為園區環境教育的重要據點。藉由提供動物寬廣且具隱蔽的生態環境，讓動物避開人為過度的干擾，並展現如野外般自然的生活習性和行為。展示區以多種臺灣的保育類野生動物貫連成保育廊道，包括臺灣黑熊、穿山甲、歐亞水獺、白鼻心、石虎、山羌等。唯有認識、瞭解本土野生動物，才能愛護、保育牠們，並進而珍惜我們共同生存的這塊土地！",
                        "e_memo": "",
                        "e_geo": "MULTIPOINT ((121.5805931 24.9985962))",
                        "e_url": "https://youtu.be/QIUbzZ-jX_Y"
                    },
                    {
                        "_id": 2,
                        "_importdate": {
                            "date": "2022-05-09 14:47:38.973108",
                            "timezone_type": 3,
                            "timezone": "Asia/Taipei"
                        },
                        "e_no": "2",
                        "e_category": "戶外區",
                        "e_name": "兒童動物區",
                        "e_pic_url": "http://www.zoo.gov.tw/iTAP/05_Exhibit/02_ChildrenZoo.jpg",
                        "e_info": "自有人類文明發展以來，動物以及自然與人類的關係便開始有著多樣動態的平衡，有的時候是動物傷害人類，有的時候是大自然對人類濫用資源的反撲，但多半時候都是人類因不同的目的而使用動物。兒童區的展示邏輯希望能讓遊客在與動物最近的距離重新檢視人與動物的關係。\n兒童動物區的設計以「學習園地」為主軸，內有可愛動物、農村動物、農村生態等展示區，其中包含了農村常見的家禽如鴨、雞；家畜如羊駝、迷你馬等，這些動物都是早經人類馴服及利用，對人類文明的發展貢獻很大。簡單來說，將「生態教育」融入農村風景中是兒童動物區展示的特色。\n兒童區的多樣物種展示，包括作物生態展示、農莊動物展示區、小型食肉目動物展示區、靈長類區、外來種區以及動物行為學院，就是依循著人類與動物關係的演變而規劃的展示。其中農莊相關展示除了不定期的稻作及水車展現臺灣先民以農立國的精神外，也讓都市人可以體驗實際鄉村的生活情懷。家禽區的開放展示讓遊客在兒童區漫步時，得以有不定期與雞鴨鵝群相遇的驚喜。走入式有蹄動物配合定時餵食讓遊客可以更近距離觀察奇蹄與偶蹄目的外觀差異。靈長類區則有著非洲舊世界猴與冠鶴的混種展示。\n為了加深民眾對於野生動物的瞭解，原來的兒童劇場改造後落成的「動物行為學院」，搭配「動物空中走道」銜接戶外活動場，動物可由此處自行進入學院內，未來民眾將有更多的機會近距離觀察與認識動物。除此之外，在廊道的中途設置了精巧可愛的樹屋，吸引動物在此停留，記得?起頭看看上方的廊道，或許剛好有狐猴經過，就能以不同的角度，欣賞牠們身手矯健的身影唷！",
                        "e_memo": "",
                        "e_geo": "MULTIPOINT ((121.5819383 24.9989718))",
                        "e_url": "https://youtu.be/CC4dlmRIVls"
                    },
                    {
                        "_id": 3,
                        "_importdate": {
                            "date": "2022-05-09 14:47:38.974848",
                            "timezone_type": 3,
                            "timezone": "Asia/Taipei"
                        },
                        "e_no": "3",
                        "e_category": "戶外區",
                        "e_name": "熱帶雨林區",
                        "e_pic_url": "http://www.zoo.gov.tw/iTAP/05_Exhibit/03_TropicalRainforest.jpg",
                        "e_info": "熱帶雨林是地球的珍寶，除了孕育多樣性的動、植物之外，同時也提供全球生物極大比例的氧氣；此外，熱帶雨林還藉著水蒸氣的循環，維持地球穩定的降雨。因此，熱帶雨林的消失，將威脅地球所有生物的生存與平衡。目前，以婆羅洲為主的亞洲熱帶雨林，是地球上僅次於亞馬遜河流域的熱帶雨林集中地。\n熱帶雨林區的展示空間，以南美洲亞馬遜河流域環境以及亞洲東南亞熱帶雨林為主軸，展示熱帶雨林生物多樣性特色與氛圍，完整呈現分布在赤道附近，高溫潮溼且植物種類繁多的熱帶雨林意象，進一步強化動物園推動生物多樣性保育研究與教育的功能。\n本園熱帶雨林區主要模擬東南亞熱帶雨林的自然生態景觀，依展示動線規劃成河口生態、密林生態及林緣生態三大展示區，區內可見板根、氣生根、支柱根、附生植物、林間霧氣等熱帶雨林特有的生態現象，是國內首座兼具雨林景觀與活體動物的生態展示，也是環境教育的最佳場所。",
                        "e_memo": "",
                        "e_geo": "MULTIPOINT ((121.5834188 24.9950215))",
                        "e_url": "https://youtu.be/yamAoW3HqKY"
                    },
                    {
                        "_id": 4,
                        "_importdate": {
                            "date": "2022-05-09 14:47:38.976084",
                            "timezone_type": 3,
                            "timezone": "Asia/Taipei"
                        },
                        "e_no": "4",
                        "e_category": "戶外區",
                        "e_name": "沙漠動物區",
                        "e_pic_url": "http://www.zoo.gov.tw/iTAP/05_Exhibit/04_DesertAnimal.jpg",
                        "e_info": "沙漠的特徵是乾旱、高溫及晝夜溫差大，年雨量不到二百五十公釐，而且大氣中水分的蒸發速度超過降雨量。在這種惡劣環境之下，水分快速的蒸發，生物必須要有特殊的生存策略才能得以存活。\n沙漠動物區以隨風搖曳的棕櫚樹模擬中東地區的沙漠環境，展示具代表性的弓角羚羊、非洲野驢及最具沙漠動物代表性的單峰駱駝和雙峰駱駝。來到這裡，你就能知道動物用什麼方式適應乾旱、高溫及晝夜溫差大的氣候喔！",
                        "e_memo": "",
                        "e_geo": "MULTIPOINT ((121.5851489 24.9952621))",
                        "e_url": "https://youtu.be/dsysEaoS_Mg"
                    },
                    {
                        "_id": 5,
                        "_importdate": {
                            "date": "2022-05-09 14:47:38.977447",
                            "timezone_type": 3,
                            "timezone": "Asia/Taipei"
                        },
                        "e_no": "5",
                        "e_category": "戶外區",
                        "e_name": "澳洲動物區",
                        "e_pic_url": "http://www.zoo.gov.tw/iTAP/05_Exhibit/05_AustralianAnimal.jpg",
                        "e_info": "由於澳洲大陸長期與其他陸地隔離，繁衍並演化出與其他陸域不同形態的物種，使得無尾熊、袋熊、袋狼、袋獾等有袋類動物得以在此生生不息，演化出各式各樣的生命形式。再加上以鴨嘴獸、針鼴為首的原始卵生哺乳動物，也只出現在澳洲及其他附近島嶼，因此僅管澳洲只佔地球面積的極小比例，仍然受到生物地理學家相當大的重視。\n為了塑造澳洲大陸的情境，本區種植了許多種澳洲特有的桉樹 (尤加利樹)。園區飼養著有袋類的灰袋鼠、食火雞，以及體型分列世界第二走禽「鴯?」，值得大小朋友一起來認識牠們喔！",
                        "e_memo": "",
                        "e_geo": "MULTIPOINT ((121.5853326 24.994184))",
                        "e_url": "https://youtu.be/hZfJ4OG10uU"
                    },
                    {
                        "_id": 6,
                        "_importdate": {
                            "date": "2022-05-09 14:47:38.978673",
                            "timezone_type": 3,
                            "timezone": "Asia/Taipei"
                        },
                        "e_no": "6",
                        "e_category": "戶外區",
                        "e_name": "非洲動物區",
                        "e_pic_url": "http://www.zoo.gov.tw/iTAP/05_Exhibit/06_AfricanAnimal.jpg",
                        "e_info": "非洲大陸被譽為野生動物的王國，擁有世界最龐大的動物族群，不僅動物種類豐富，數量亦最為壯觀，當地動物的物種在種類及數量上都令人讚嘆，如此壯觀、醒目的場景，總是讓遊客留下深刻的印象。非洲動物區規劃數個不同種類動物混群展示的展場，展示主題是模擬東非莽原情境，在白天時鄰近水塘的樹蔭與灌叢附近是各種動物聚集的場所，水塘提供飲水，高樹提供遮蔭；晨昏陽光較弱時，草食動物會在草原上四處漫步休息，或在長草區潛伏，伺機發動突襲，呈現典型的非洲草原景觀。只要沿著遊客動線參觀，就能夠感受到宛如置身於非洲莽原中的最佳情境體驗，快來這裡拜訪陸地上體型最大和身高最高的動物吧！",
                        "e_memo": "",
                        "e_geo": "MULTIPOINT ((121.5880094 24.9951333))",
                        "e_url": "https://youtu.be/iz-WsXVszd8"
                    },
                    {
                        "_id": 7,
                        "_importdate": {
                            "date": "2022-05-09 14:47:38.979888",
                            "timezone_type": 3,
                            "timezone": "Asia/Taipei"
                        },
                        "e_no": "7",
                        "e_category": "戶外區",
                        "e_name": "溫帶動物區",
                        "e_pic_url": "http://www.zoo.gov.tw/iTAP/05_Exhibit/07_TemperateZone.jpg",
                        "e_info": "溫帶動物區佔地球上極廣大的範圍，除了溫度的因子外，依年雨量的不同，溫帶區又可細分為溫帶沙漠、草原及森林（落葉林及針帶林）等不同生態環境，其孕育了種類繁多的野生動物。由於此區的氣候也很適於人類活動居住，許多溫帶地區的動物都遭遇人類活動的干擾，他們的族群量因遭受獵捕、棲息環境被破壞而減少，甚至面臨瀕臨絕種的危機。本園溫帶動物區主要展示棲息諄帶氣候區的草原和森林中的動物，包括有蒙古野馬、美洲野牛、棕熊、亞洲黑熊、山獅、林?、河狸、小爪水獺、小貓熊等，許多種類在其原棲息地都已數量稀少或瀕臨絕種，需要我們一起來關心牠們的保育。",
                        "e_memo": "",
                        "e_geo": "MULTIPOINT ((121.5896013 24.9931447))",
                        "e_url": "https://youtu.be/i_HRtJNPpTY"
                    },
                    {
                        "_id": 8,
                        "_importdate": {
                            "date": "2022-05-09 14:47:38.981151",
                            "timezone_type": 3,
                            "timezone": "Asia/Taipei"
                        },
                        "e_no": "8",
                        "e_category": "戶外區",
                        "e_name": "鳥園區",
                        "e_pic_url": "http://www.zoo.gov.tw/iTAP/05_Exhibit/08_BirdWorld.jpg",
                        "e_info": "鳥類的外型美麗、聲音悅耳、外型也十分讓人喜愛，是我們周遭環境中，最容易找到的動物。全世界的鳥類約九千種，本園飼養約90種，數量達600隻，是園區數量龐大的一族。\n鳥園區佔地約四公頃，包括鳥類形態區、雉類與珍禽區、鶴園、鸚鵡屋、生態鳥園及水禽區，從華麗繽紛的孔雀、羽色鮮艷的鸚鵡家族，到瀕臨絕種的熊鷹、綠簑鴿等世界各地的鳥類，可以觀察到住在不同棲息地的鳥類，是都會環境中難得的賞鳥據點。\n從歷史上各階段人類對待鳥類的態度中，也可學到以鳥類為媒介的人文與自然。歡迎放慢腳步，來鳥園參觀一趟，聽聽悅耳鳥鳴、看看羽色繽紛的輕盈身影，也就等於環遊世界，做一次賞鳥知性之旅，感受另一個廣闊而自由的世界。",
                        "e_memo": "",
                        "e_geo": "MULTIPOINT ((121.5888946 24.9957179))",
                        "e_url": "https://youtu.be/vOMa3WJS36w"
                    },
                    {
                        "_id": 9,
                        "_importdate": {
                            "date": "2022-05-09 14:47:38.982249",
                            "timezone_type": 3,
                            "timezone": "Asia/Taipei"
                        },
                        "e_no": "9",
                        "e_category": "室內區",
                        "e_name": "教育中心",
                        "e_pic_url": "http://www.zoo.gov.tw/iTAP/05_Exhibit/09_EducationCenter.jpg",
                        "e_info": "教育中心位於大門入口的正前方，是本園資訊傳遞、教育活動及靜態展示的樞紐，為本園展示動物園文化的櫥窗，包括動物生態及恐龍博物館、演講廳及動物標本、模型、生態全景展示及多媒體等方式，傳達動物知識及保育觀念，使遊客感受到人、動物及環境間的密切關聯。\n全館常設展區包括：現代方舟、動物園園史區、林旺展示區、恐龍探索館及自然生態保育區。",
                        "e_memo": "每週一休館，入館門票：全票20元、優待票10元",
                        "e_geo": "MULTIPOINT ((121.5818524 24.9978621))",
                        "e_url": "https://youtu.be/GnJOEQ_LHbo"
                    },
                    {
                        "_id": 10,
                        "_importdate": {
                            "date": "2022-05-09 14:47:38.983708",
                            "timezone_type": 3,
                            "timezone": "Asia/Taipei"
                        },
                        "e_no": "10",
                        "e_category": "室內區",
                        "e_name": "企鵝館",
                        "e_pic_url": "http://www.zoo.gov.tw/iTAP/05_Exhibit/10_PenguinHouse.jpg",
                        "e_info": "企鵝分布於南半球，是不會飛的水生鳥類，卻是游泳專家，在水裡潛泳可以「飛」得又快又好。現在的企鵝約有18種，有些種類一生中約有75%時間生活在海上，僅在繁殖和換羽時才登上岸。\n企鵝館展示「國王企鵝」及「黑腳企鵝」。2001年9月企鵝館中的國王企鵝首度繁殖成功，孵出第一隻國王企鵝寶寶。野外的企鵝寶寶在父母的照顧下，約34-40天後加入幼鳥的群體生活，待10至13個月換羽後便可下海獨立生活。國王企鵝主要分布在南美、紐西蘭及南非南方海域等地；喜歡吃魚、磷蝦及烏賊。繁殖季時會大量聚在一起，每次只生一個蛋。通常是企鵝爸媽輪流孵蛋，待8周後企鵝寶寶孵出為止。\n\n在觀賞可愛的企鵝之餘，也可以在企鵝館了解牠們的分布、形態特徵、生活習性及繁殖求偶行為喔！",
                        "e_memo": "每月第二個週一休館",
                        "e_geo": "MULTIPOINT ((121.5911959 24.9929758))",
                        "e_url": "https://youtu.be/i_HRtJNPpTY"
                    },
                    {
                        "_id": 11,
                        "_importdate": {
                            "date": "2022-05-09 14:47:38.984922",
                            "timezone_type": 3,
                            "timezone": "Asia/Taipei"
                        },
                        "e_no": "11",
                        "e_category": "室內區",
                        "e_name": "無尾熊館",
                        "e_pic_url": "http://www.zoo.gov.tw/iTAP/05_Exhibit/11_KoalaHouse.jpg",
                        "e_info": "無尾熊是在南半球澳洲大陸上著名的有袋目動物。無尾熊屬於夜行性動物，白天大部分的時間都在睡覺和休息，可達17-20小時。 牠們最愛吃新鮮桉(尤加利)樹的嫩枝葉。成年的雄性還會用胸腺的分泌物在樹幹上做標記，以留下氣味來劃定自己的地盤。\n來自澳洲昆士蘭黃金海岸市的「庫倫賓野生動物保護區」，代表城市友誼並肩負保育、教育使命的無尾熊們，自引進以來一直都是眾所矚目的焦點。無尾熊館設有多個獨立空間，每間屋頂都有天窗可以讓陽光照射進來。在適當天氣時，無尾熊偶爾也會到戶外展示場活動，享受溫暖的陽光。\n1999年8月首度來臺的兩隻公無尾熊，牠們是來自於澳洲昆士蘭黃金海岸市的「庫倫賓野生動物保護區」，不但代表兩市之間的深厚友誼，也肩負了保育和教育的重要使命。而母無尾熊，也在2001年9月來到臺北與牠們相聚。隨後無尾熊寶寶在眾人的期盼下出生，當母子無尾熊相依偎的畫面呈現在遊客面前時，大家不禁讚嘆生命的奧妙，同時也感到十分溫馨呢！2011、2018年陸續又有來自澳洲同一保護區的新成員加入，使無尾熊館變得更生氣蓬勃也更有人氣呢！",
                        "e_memo": "",
                        "e_geo": "MULTIPOINT ((121.5828744 24.9982291))",
                        "e_url": "https://youtu.be/QzaXHqnp9S0"
                    },
                    {
                        "_id": 12,
                        "_importdate": {
                            "date": "2022-05-09 14:47:38.986110",
                            "timezone_type": 3,
                            "timezone": "Asia/Taipei"
                        },
                        "e_no": "12",
                        "e_category": "室內區",
                        "e_name": "兩棲爬蟲動物館",
                        "e_pic_url": "http://www.zoo.gov.tw/iTAP/05_Exhibit/12_AmphibianReptile.jpg",
                        "e_info": "兩棲爬蟲動物館位於本園的鳥園區與溫帶動物區之間，波浪狀的屋頂模擬蜿蜒的蛇區造型，結合銀灰金屬色調，是一座相當具有現代藝術風格的展示館。\n本館包含世界動物區、臺灣兩棲爬蟲動物區與教育解說廊道3個展示區塊，分別展示介紹世界各地與臺灣土地上的兩棲類與爬蟲類動物，教育解說廊道介紹兩棲爬蟲動物的生態與面臨困境。館內還有兩棲爬蟲教室提供相關課程及定期的Keeper's Talk教育解說活動，希望藉由各類動物、寫實模型、互動教材與文化藝品的多元展示，引導遊客進入兩棲爬蟲動物的奧秘世界。",
                        "e_memo": "每月第三個週一休館",
                        "e_geo": "MULTIPOINT ((121.5898494 24.9940697))",
                        "e_url": "https://youtu.be/ZEaAOtEj1VA"
                    },
                    {
                        "_id": 13,
                        "_importdate": {
                            "date": "2022-05-09 14:47:38.987430",
                            "timezone_type": 3,
                            "timezone": "Asia/Taipei"
                        },
                        "e_no": "13",
                        "e_category": "室內區",
                        "e_name": "昆蟲館",
                        "e_pic_url": "http://www.zoo.gov.tw/iTAP/05_Exhibit/13_Insectarium.jpg",
                        "e_info": "昆蟲館位於南北座向的山谷中，建築物佔地面積1990.54平方公尺，為兩層樓建築。\n館內依時間順序來做展示：\n序幕大廳：以大型鍬形蟲的模型為開場，為大家介紹昆蟲的起源與演化、昆蟲的構造與適應等主題；多功能視聽教室，以影片來讓遊客對全館設施有初步的瞭解。\n生態展示室：分為溫室與網室兩部分，讓來訪者可以沉浸在身邊處處蝶舞的自然環境中。\n本館具有許多互動式的科學裝置，可讓來訪者親自操作和體驗。此外，館區後方有一個面積約10公頃的「蟲蟲探索谷」。其中擁有豐富的昆蟲資源，全年可見的蝴蝶種類多達125種以上，為本園進行戶外生態解說教育與沉浸式自然體驗的最佳場所之一。",
                        "e_memo": "每月第四個週一休館",
                        "e_geo": "MULTIPOINT ((121.5807004 24.9967402))",
                        "e_url": "https://youtu.be/mvPN8N3JoK4"
                    },
                    {
                        "_id": 14,
                        "_importdate": {
                            "date": "2022-05-09 14:47:38.988608",
                            "timezone_type": 3,
                            "timezone": "Asia/Taipei"
                        },
                        "e_no": "14",
                        "e_category": "室內區",
                        "e_name": "新光特展館（大貓熊館）",
                        "e_pic_url": "http://www.zoo.gov.tw/iTAP/05_Exhibit/14_PandaHouse.jpg",
                        "e_info": "新光特展館 (大貓熊館) 包括一個戶外展示場和兩個室內展示館。\n戶外展示場模擬大貓熊野外棲息地，草坪寬闊，並以濃綠喬木構成背景，還有大小石塊及流瀑水池，提供動物活動空間及攀爬、遮陰設施。室內展示館則具有空調設備，夏天以空調調控溫濕度；冬天則採自然通風，讓大貓熊們住得既舒服又健康。",
                        "e_memo": "每月第一個週一休館",
                        "e_geo": "MULTIPOINT ((121.5830956 24.9968265))",
                        "e_url": "https://youtu.be/TIq8Yb97yPs"
                    },
                    {
                        "_id": 15,
                        "_importdate": {
                            "date": "2022-05-09 14:47:38.990228",
                            "timezone_type": 3,
                            "timezone": "Asia/Taipei"
                        },
                        "e_no": "15",
                        "e_category": "室內區",
                        "e_name": "熱帶雨林室內館（穿山甲館）",
                        "e_pic_url": "http://www.zoo.gov.tw/iTAP/05_Exhibit/15_PangolinDome.jpg",
                        "e_info": "位在熱帶雨林區的穿山甲館，是以臺灣穿山甲意象為造型，穿山甲為本園焦點物種，保育繁殖成果深受國際動物園界的認可，這棟仿生建築不僅是動物園界的創舉，更同時結合生物多樣性、日常節能、二氧化碳減量等設計，並經內政部認可為「黃金級」綠建築。\n在穿山甲館樓高24公尺展示空間中，以南美洲亞馬遜河流域環境為展示主軸，顯現熱帶雨林的生物多樣性特色與氛圍。藉由高層空間，融合水域、樹林、樹冠層的沉浸式複合生態系，使遊客如同置身雨林中，以不同感官體驗雨林多樣的生物組成，了解保育雨林的重要性，進而支持參與雨林保育。",
                        "e_memo": "",
                        "e_geo": "MULTIPOINT ((121.5828662 24.9967279))",
                        "e_url": "https://youtu.be/O7n6wBoYZko"
                    },
                    {
                        "_id": 16,
                        "_importdate": {
                            "date": "2022-05-09 14:47:38.992061",
                            "timezone_type": 3,
                            "timezone": "Asia/Taipei"
                        },
                        "e_no": "16",
                        "e_category": "特展區",
                        "e_name": "酷Cool節能屋",
                        "e_pic_url": "http://www.zoo.gov.tw/iTAP/05_Exhibit/16_EcoHouse.jpg",
                        "e_info": "經濟部能源局及工業技術研究院，結合臺北市立動物園的環境教育及生態保育理念，建造這一棟位於沙漠動物區入口處的酷Cool節能屋。這是一座結合空間設計、節能材料及再生能源利用的節能建築，導入童話故事的解說活動，適合全家人一起來體驗。",
                        "e_memo": "每週一休館",
                        "e_geo": "MULTIPOINT ((121.5742216 24.9946471))",
                        "e_url": "https://www.zoo.gov.taipei/cp.aspx?n=AD3F5EEDB3035063&s=6FCE126BDECE999C"
                    }
                ]
            }
        }
        """#
        return resultJson
    }
    
}

// postituste andmebaas
const posts = [
    {
        id: 1,
        userId: 1,
        title: 'Kuidas minust hobi-kokk sai',
        content: 'Mina olen uus blogi pidaja ja kõigepealt kirjeldan ennast. Ma hakkan postitusi tegema korra nädalas esmaspäeviti.',
        categoryId: 1,
    },
    {
        id: 2,
        userId: 1,
        title: 'Kevad 2024',
        content: 'Tere kevad-suvi 2024! Uued hooajad toovad endaga kaasa mitmeid põnevaid moesuundi, mis muudavad meie garderoobi kirevamaks ja stiilsemaks. Tutvume koos mõningate trendidega, mis saavad sel hooajal kuumaks.',
        categoryId: 2,
    },
    {
        id: 3,
        userId: 2,
        title: 'Terrassi kaunistamine',
        content: 'Soojad ilmad on tulekul ning hing ihkab värsket õhku ja päikesepaistet. Rõdu või terrass on kodus paik, kus rahulikult hommikukohvi nautida, õhtuti raamatut lugeda või sõpradega grillipidusid pidada. Kui terrassiehituse idee on mõtteis olnud juba pikemat aega, siis kevad on suurepärane aeg terrassi ehitusega alustamiseks.',
        categoryId: 3,
    },
];

module.exports = posts;

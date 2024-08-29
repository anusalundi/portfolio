# BLOGI rakendus

## Ressursid
### Tegevus - POST (postita)
- ID
- Kasutaja ID
- Pealkiri
- Sisu
- Kategooria ID
Näiteks:
```
{
        id: 1,
        userId: 1,
        title: 'Kuidas minust hobi-kokk sai',
        content: 'Mina olen uus blogi pidaja ja kõigepealt kirjeldan ennast. Ma hakkan postitusi tegema korra nädalas esmaspäeviti.',
        categoryId: 1,
    }
```
### Kasutaja
- ID
- Eesnimi
- Perenimi
- E-post
- Parool
Näiteks:
```
{
        id: 1,
        firstName: 'Leo',
        lastName: 'Lammas',
        email: 'leolammas@gmail.com',
        password: 'Leo123',
    }
```
### Kategooria
- ID
- Pealkiri
- Postituse ID
Näiteks:
```
{
        id: 1,
        title: 'Kokandus',
        postId: 1,
    }
```
### Kommentaar
- ID
- Kasutaja ID
- Postituse ID
- Sisu
Näiteks:
```
{
        id: 1,
        userId: 3,
        postId: 1,
        content: `Väga hea postitus. Jään järgmist ootama ${:)}`,
    }
```

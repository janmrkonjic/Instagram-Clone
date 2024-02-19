# Avtonet
Fake Avtonet

## Vsebina
+ [O Projektu](#opis)
+ [Začetki](#zacetki)
+ [Delovanje](#delovanje)
+ [Zaključek](#zaključek)


 
## O Projektu <a name = "opis"></a>
Ime mojega projekta je Fake Avtonet, saj je v bistvu kopija najbolj popularne slovenske spletne strani za iskanje avtomobilov in na splošno vseh motornih vozil. V svojem 
projektu sem poskušal čim bolj natančno posnemati funkcije, ki jih ponuja originalna spletna stran.

## Začetki <a name = "zacetki"></a>
Na začetku je bilo potrebno seveda narediti nov projekt v orodju VS Code, za katerega sem se odločil. Vedel sem, da bom v prihodnje potreboval tudi ostala orodja, ki sem 
si jih moral namestiti.
Namestil sem si Composer s to kodo:
```
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
```
Namestil sem si tudi knjižnici za Google in Facebook login, ki sem ju kasneje potreboval.
Knjižnica za Google Login:
```
composer require google/apiclient
```
In še knjižnica za Facebook Login:
```
composer require facebook/graph-sdk --ignore-platform-reqs
```

Pred tem sem si še moral ustvariti račun na spletni strani Google Cloud in na spletni strani Meta for Developers.

Google Cloud: https://cloud.google.com/

Meta for Developers: https://developers.facebook.com/

Delo sem začel z E-r diagramom, v katerem sem naredil vse tabele, ki bodo v bazi in jih med seboj pravilno povezal.
Kasneje sem datoteko uvozil v bazo in baza je bila pripravljena.

<img width="136" alt="baza" src="https://github.com/janmrkonjic/Avtonet/assets/130756503/e7299e0e-2617-48c8-a123-8f0131e3e583">

Nato sem nadaljeval z login in registration stranjo in sem ju kar hitro uspel narediti.

Naslednja naloga je bila glavna stran, ki mi je vzela kar veliko časa. Na njej lahko iščeš posamezna vozila in oglase, ki se nahajajo na spletni strani.

Naredil sem še ostale strani, npr. stran, kjer lahko objaviš svoj oglas za avto, ali pa stran, kjer lahko vidiš vse oglase in podobno.

Na koncu sta me čakala samo še Google in Facebook login, ki sem ju z nekaj težavammi uspešno implementiral.

<img width="466" alt="image" src="https://github.com/janmrkonjic/Avtonet/assets/130756503/0375df99-df7b-4794-8c9a-27f2bddb89b9">

## Delovanje <a name = "delovanje"></a>
Na začetku lahko na moji spletni strani iščeš oglase tudi brez prijave. Lahko vidiš vse oglase ali pa jih ročno iščeš.

<img width="943" alt="image" src="https://github.com/janmrkonjic/Avtonet/assets/130756503/2c0a5da2-3e50-46d0-9807-20153ad2aec8">

Del kode za iskanje s pomočjo select inputa:

```
         <!-- Brand filter -->
         <select name="znamka" id="brand">
            <option value="">Znamka</option>
            <!-- Populate the options dynamically using PHP -->
            <?php

                // Query to retrieve brands from the "znamke" table
                $query = "SELECT id, ime FROM znamke"; // Selecting id and ime columns
                $stmt = $pdo->prepare($query);
                $stmt->execute();
                $brands = $stmt->fetchAll(PDO::FETCH_ASSOC);

                foreach ($brands as $brand) {
                    echo '<option value="' . $brand['id'] . '">' . $brand['ime'] . '</option>';
                }
  
            ?>
```

Če želiš objaviti svoj oglas, se je potrebno registrirati, ali pa prijaviti z Googlom ali Facebookom.

<img width="459" alt="image" src="https://github.com/janmrkonjic/Avtonet/assets/130756503/571248a9-9bf4-4ba6-a75a-16b2b89489ca">

Ko se uspešno prijaviš, lahko dodaš tudi svoj oglas, ki bo viden vsem uporabnikom. Objaviš lahko tudi sliko vozila.

<img width="938" alt="image" src="https://github.com/janmrkonjic/Avtonet/assets/130756503/87dbb6b1-6ee2-4cab-804e-19f3101baa32">

Admin ima posebej stran, do katere lahko dostopa samo on in tam lahko izbriše oglase in uporabnike te spletne strani.

<img width="437" alt="image" src="https://github.com/janmrkonjic/Avtonet/assets/130756503/10dd4f6a-1138-42fd-8d5c-8354d5f76bdd">

<img width="544" alt="image" src="https://github.com/janmrkonjic/Avtonet/assets/130756503/9f438330-8e09-4d18-8f80-35244bc420fb">

Seveda ima do te strani dostop samo admin, saj sem s kodo ostalim uporabnikom dostop onemogočil.

```
function adminOnly() {
    //če ni admin, ga preusmeri na index
    if (!isAdmin()) {
        header("Location: index.php");
        die();
    }
}
```
Velik pomen v mojem projektu ima tudi podatkovna baza, saj se v njo shranjujejo vsi podatki. Lahko vidiš kateri uporabniki so vnešeni, kateri oglasi so v bazi... V bazi so prav tako tudi znamke, modeli in barve vozil, za lažje vnašanje in dodajanje novih oglasov za uporabnike.

<img width="616" alt="image" src="https://github.com/janmrkonjic/Avtonet/assets/130756503/d8bb2eb1-2b53-494b-9450-bcf82c3561ff">

## Zaključek <a name = "zacetki"></a>
Ta projekt mi je še dodatno pomagal nadgraditi moje znanje programskega jezika php. Znanje iz lanskega leta sem dopolnim še z veliko nove kode, ki je bila bolje in učinkoviteje napisana, ter prijavo, ki je bila varnejša kot prej, saj je bila nareta s pdo. Iz tega projekta sem odnesel veliko novega znanja in se v prihodnosti že veselim novih projektov.

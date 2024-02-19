# Instagram-clone
Instagram-clone made by janmrkonjic

## Vsebina
+ [O Projektu](#opis)
+ [Delovanje](#zacetki)
+ [Zaključek](#zakljucek)


 
## O Projektu <a name = "opis"></a>
Ime mojega projekta je Instagram-clone, ker je v bistvu poenostavljena verzija aplikacije instagram.

## Začetki <a name = "zacetki"></a>
Na začetku je bilo potrebno seveda narediti nov Ruby projekt, ki sem ga poimenoval Instagram.<br>
<img width="179" alt="image" src="https://github.com/janmrkonjic/Instagram-Clone/assets/130756503/406504e6-1034-48dc-8705-c25a97d31705">

Delo sem začel z ustvarjanjem login paga, ki sem ga poskusil narediti čim bolj podobnega originalnemu instagram pagu. Uporabil sem tudi official instagram slike, ki jih uporabljajo na njihovi strani.

Za prijavo in registracijo sem uporabil Devise gem: https://github.com/heartcombo/devise

Izgled login strani:<br>
<img width="353" alt="image" src="https://github.com/janmrkonjic/Instagram-Clone/assets/130756503/f02eefde-5fea-4957-8055-650907258e34">

Izgled register strani:<br>
<img width="353" alt="image" src="https://github.com/janmrkonjic/Instagram-Clone/assets/130756503/c6941b06-c8aa-4c1b-8d0c-4325027b8326">

Naslednja naloga je bila priprava na izdelovanje posta. Najprej sem se odločil, da bom naredil izdelovanje postov enako, kot je na instagramu.
Naredil sem ikono, s katero lahko narediš nov post:<br>
<img width="86" alt="image" src="https://github.com/janmrkonjic/Instagram-Clone/assets/130756503/46bb8065-8832-46fa-8a2e-2baf6d99d7d1">

Ko to klikneš, se prikaže okno, kjer izbereš sliko iz svojega računalnika:<br>
<img width="371" alt="image" src="https://github.com/janmrkonjic/Instagram-Clone/assets/130756503/b6acbd2f-5f48-4d54-a522-7925a145e996">

Nato sem z uporabo cropperjs omogočil uporabniku, da svoj post izreže, preden ga posta.<br>
Cropperjs: https://fengyuanchen.github.io/cropperjs/

Uporaba cropperjs:<br>
```
<div class="py-4" data-controller="photo-cropper">
    <h3>Crop picture</h3>
     <div class="mb-3">
          <%= image_tag Post.last.photo.variant(resize_to_limit: Post::RESIZE_DIMENSIONS), data: { "photo-cropper-target" => "image" } %>
     </div>

    <%= form_with model: @post, data: { "photo-cropper-target" => "form" } do |f| %>
         <%= f.hidden_field :x_offset, data: { "photo-cropper-target" => "xOffset" } %>
        <%= f.hidden_field :y_offset, data: { "photo-cropper-target" => "yOffset" } %>
         <%= f.hidden_field :width, data: { "photo-cropper-target" => "width" } %>
         <%= f.hidden_field :height, data: { "photo-cropper-target" => "height" } %>
         <%= f.hidden_field :status, value: "applying_filter" %>
        <%= f.submit "Crop picture", class:"btn btn-primary insta-primary" %>
     <% end %>
 </div>
```

Izgled croppanja slike:<br>
<img width="590" alt="image" src="https://github.com/janmrkonjic/Instagram-Clone/assets/130756503/5cedc7d9-ec56-4eed-b175-3db3ecb9b8a5">

Ko si zadovoljen z izrezano sliko, ji lahko še dodaš filter. To sem naredil s Pixelsjs.<br>
Pixelsjs: https://pixelsjs.readthedocs.io/en/latest/

Izbira filtra in prikaz slike z dodanim filtrom:<br>
<img width="556" alt="image" src="https://github.com/janmrkonjic/Instagram-Clone/assets/130756503/4d889c40-b62d-42e2-a791-372aca56ab93">

Koda za stran, kjer si izbereš filter:
```
<div class="py-5 d-flex justify-content-center align-items-center" data-controller="apply-filter">
    <div>
    <h1 class="fs-3">Applying filters</h1>
        <%= image_tag @post.photo.variant(resize_to_limit: Post::RESIZE_DIMENSIONS,
        crop: [@post.x_offset.to_f, @post.y_offset.to_f, @post.width.to_f, @post.height.to_f]), 
        data: { "apply-filter-target" => "hiddenImage", filter: "" }, 
        class: "mb-5 d-none" %>

        <%= image_tag @post.photo.variant(resize_to_limit: Post::RESIZE_DIMENSIONS, 
        crop: [@post.x_offset.to_f, @post.y_offset.to_f, @post.width.to_f, @post.height.to_f]), 
        data: { "apply-filter-target" => "image", filter: "" }, 
        class: "mb-5" %>

        <div class="d-flex align-content-around flex-wrap mb-5">
            <% PhotoFilter::FILTERS.each do |filter| %>
                <%= button_tag filter, data: { "apply-filter-target" => "filterButton", "action" => "apply-filter#applyFilter", "filter-name" => filter }, class: "btn btn-primary insta-primary me-2 mb-2" %>
            <% end %>
        </div>
        
        <%= form_with model: @post, data: { "apply-filter-target" => "form" } do |f| %>
            <%= f.hidden_field :filter_name, data: { "apply-filter-target" => "filterName" } %>
            <%= f.hidden_field :status, value: "final_draft" %>
            <%= f.submit "Apply filter", class: "btn btn-primary insta-primary" %>
        <% end %>
        </div>
</div>
```

Še zadnja stvar preden se post objavi je, da lahko uporabnik doda opis postu.<br>
<img width="303" alt="image" src="https://github.com/janmrkonjic/Instagram-Clone/assets/130756503/d8e422b5-d270-468c-9c37-6908b5d30e86">

Na homepagu lahko vidimo prikazan nov post. Vidimo lahko username (email) uporabnika, opis ter datum, kdaj je bil post ustvarjen.<br>
<img width="399" alt="image" src="https://github.com/janmrkonjic/Instagram-Clone/assets/130756503/65b5875e-8144-4562-b8a0-54e41127d7e2">

Končna koda za homepage:<br>
```
<div class="d-flex py-4 justify-content-center align-items-center">
  <div>
    <% Post.includes(:user).order(created_at: :desc).each do |post| %>
      <div class="mb-4">
        <p class="mb-1 fw-bold" style="font-size: 13px;"><%= post.user.email %></p>
        <%= image_tag post.photo.variant(resize_to_fill: Post::RESIZE_DIMENSIONS), data: { controller: "photo-filter", filter: post.filter_name } %><br>
        <p class="mb-1" style="font-size: 13px;"><span class="fw-bold"><%= post.user.email %></span> <%= post.description %> </p>
        <p class="mb-1" style="font-size: 12px; color: #999;"><%= post.created_at.strftime("%B %d, %Y %I:%M %p") %></p>
      </div>
      <hr>
    <% end %>
  </div>
</div>

```

Vidimo lahko tudi vse druge poste, ki so bili objavljeni in kdo ter kdaj jih je objavil:<br>
<img width="481" alt="image" src="https://github.com/janmrkonjic/Instagram-Clone/assets/130756503/db82084a-6e7f-4a87-b063-9b74df7245e1">

## Zaključek <a name = "zakljucek"></a>
Ta projekt mi je še dodatno pomagal nadgraditi moje znanje v Ruby on Rails. Čeprav sem imel na trenutke precej veliko težav, se je na koncu vse izplačalo in sem dokončal projekt uspešno. Iz tega projekta sem odnesel veliko novega znanja in se v prihodnosti že veselim novih projektov.

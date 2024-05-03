'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"manifest.json": "04910ddb6f35e257e618795752ec6ed3",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"index.html": "90964e46cfe39c5b89abab31372726a9",
"/": "90964e46cfe39c5b89abab31372726a9",
"assets/FontManifest.json": "ec9498b0751b22edfc99ec4b3266f6c5",
"assets/AssetManifest.bin": "e5154fccd30eb64c50459ff9386aa38f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/assets/fonts/DMSans-Regular.ttf": "916f3ae325c2bcd71bec9b469c6a6aa0",
"assets/assets/fonts/DMSans-Bold.ttf": "9def97569c21a2e08c818845776c4f21",
"assets/assets/fonts/DMSans-SemiBold.ttf": "b475f362cd4f51d0bb56cb036c86ef73",
"assets/assets/fonts/DMSans-Black.ttf": "33a429d13f9321057985bb638e3bd9d4",
"assets/assets/fonts/DMSans-Light.ttf": "737e8e7b386545e9636f14b1678e9d82",
"assets/assets/fonts/DMSans-Medium.ttf": "2dd767322ccc760c0c31d6a900b9d3b2",
"assets/assets/images/previous.png": "3b0da2f225ad56ab4856c443ef3c6ee0",
"assets/assets/images/ic_selected.png": "540491865028fe4e47a1c23b604be3c0",
"assets/assets/images/ic_up.png": "a7bcba41722503dce093e7efc5e203a2",
"assets/assets/images/ic_kid.png": "72422374d44b1a6d5bf6cbcfbbba9bdc",
"assets/assets/images/dropdown_white_next.png": "1b32db4c8de115231e535a776ad6d033",
"assets/assets/images/report_selected.png": "d737ce74648116511493200da2c21201",
"assets/assets/images/home_selected.png": "9a3812873ec5465c3b06118e9c6940b3",
"assets/assets/images/dropdown_white.png": "250df57ffcc8ea35f9e8d133af0fc4a6",
"assets/assets/images/ic_back.png": "65e9525aeeb24ac1e36b090e6ffec0cd",
"assets/assets/images/home_unselected.png": "d51f2b8c693b7cc32a730d33c067006f",
"assets/assets/images/kid_unselected.png": "6ddbbc19821ab08f91610aaa19c5518d",
"assets/assets/images/ic_library.png": "24bc0352516c5b9db41310413d6d30bf",
"assets/assets/images/ic_delete.png": "8945c49ac8997e94c8b085d0bab8b1c9",
"assets/assets/images/dropdown_next.png": "6e094126cc18073f033676597ec66961",
"assets/assets/images/bg.png": "8ed033329fb06c0f998e89ceb1198fcf",
"assets/assets/images/setting_unselected.png": "9fa2065dd4c8515334c1d466f3b3cfd6",
"assets/assets/images/ic_checked.png": "be2bfaf8833c79b819575c398f92f31f",
"assets/assets/images/dropdown.png": "630bd4fede3a9b918f5d3556c696290e",
"assets/assets/images/ic_take_photo.png": "af6b855bbcc790a7b382912d060a66bd",
"assets/assets/images/ic_image.png": "79fb6f0bfa077d6613980cb436880786",
"assets/assets/images/ic_up_trend.png": "13e8391afdfe15af99c0a27cdf2ddcda",
"assets/assets/images/ic_avatar.png": "bd1f3ea8f4080c56bda3729f263c63c6",
"assets/assets/images/ic_category.png": "b5fb20825052d3b18a31173461e3bbaf",
"assets/assets/images/ic_viewall.png": "2e8151c523c9912dbfdfa90265964602",
"assets/assets/images/ic_add_button.png": "9a460c8b86e0517e82659992c86591bb",
"assets/assets/images/next.png": "a3735d94fd9fedc13413393cc6edd8d6",
"assets/assets/images/eye-not.png": "8991d0fc1516b1fe627934560c80df48",
"assets/assets/images/report_unselected.png": "e6592beac7b081a411a28e1e43f505c8",
"assets/assets/images/ic_unselected.png": "6c47d3c76f02388deed62ed406f9ce9a",
"assets/assets/images/bg.jpg": "16b68fe32d45b92508f98612d53457d7",
"assets/assets/images/ic_category_default.png": "614a0e95113065f7f554f58d93e3084a",
"assets/assets/images/kid_selected.png": "cc7521012e6b7ba184d6f990bb52debc",
"assets/assets/images/ic_down.png": "268f9b07c34de17d54d4af34642a9cb8",
"assets/assets/images/eye-see.png": "3cf95cde4a5f391ccab4178e56684484",
"assets/assets/images/ic_log_out.png": "38b793f32d67d7b0bae2974c5708f7f0",
"assets/assets/images/ic_more.png": "d9c42b27f079f9c9b4d97e34ffebbdd7",
"assets/assets/images/setting_selected.png": "1322cd435b33f14ba932a7a7aea1280e",
"assets/assets/images/ic_down_trend.png": "6a2746dbf0b8ecf2d4573d584f39ddd1",
"assets/assets/images/ic_calendar.png": "31e6150df11c8e2325d6d39d866c7d97",
"assets/AssetManifest.bin.json": "c12544400dfb91f7c4c9249ddd60eceb",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "48ebeca7feefef64bf19cfab5233ce44",
"assets/fonts/MaterialIcons-Regular.otf": "fc58765b23a16603767b335211f407f1",
"assets/AssetManifest.json": "475d5c18b7253970c9090098dc11299e",
"main.dart.js": "e70ee890aa4d192efe11b8917fc2eef6",
"favicon.png": "e75c0dad3139a64cab3b4ba893f197f5",
"version.json": "e12c649685da3dd8cf8e91112354ce26",
"icons/Icon-maskable-192.png": "3d61afe3c4988f59c925f41bf47d68a3",
"icons/Icon-192.png": "3d61afe3c4988f59c925f41bf47d68a3",
"icons/Icon-512.png": "e75c0dad3139a64cab3b4ba893f197f5",
"icons/Icon-maskable-512.png": "e75c0dad3139a64cab3b4ba893f197f5"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

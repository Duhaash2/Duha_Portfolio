'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "17d10255ad4a0fa19e796afba4dbe0ef",
"assets/AssetManifest.bin.json": "e96ee19a19e95f35cb850418aa145a71",
"assets/AssetManifest.json": "983127b8f4259b8c4430bf35a91ff995",
"assets/assets/cv/DuhaResumeFlutterDeveloper.pdf": "a98b823e415bb24007cb599f1b674ac4",
"assets/assets/images/duha-ph.jpg": "ec2a3bbb668b0e14cff7a2d56df4f827",
"assets/assets/images/elegant/abstract_background_1.png": "ef9f64e15e1852f601d8166b1cfe3daf",
"assets/assets/images/elegant/abstract_illustration_1.png": "9170e2fc8c4dd4705f9ba4e4f69bbfca",
"assets/assets/images/foodtek/foodtek1.jpg": "f6e63fc71a8a1b69648a92413a1e5914",
"assets/assets/images/foodtek/foodtek10.jpg": "c775084fad7bb42cdfefabd9cc14d8be",
"assets/assets/images/foodtek/foodtek11.jpg": "20e3dd35d9635d9c27b5efdd1ec49856",
"assets/assets/images/foodtek/foodtek12.jpg": "b18969fc80305fb1b3d8ff1f92bc1ee6",
"assets/assets/images/foodtek/foodtek13.jpg": "ecae989115aa14d311cfef77db307ac5",
"assets/assets/images/foodtek/foodtek14.jpg": "f39c3b5316c993711b6dd4c28a49598f",
"assets/assets/images/foodtek/foodtek15.jpg": "27369adac4aaeaca29cbb0f2ea7840b3",
"assets/assets/images/foodtek/foodtek16.jpg": "def59007709e95f4a7ce487fdf21e2b6",
"assets/assets/images/foodtek/foodtek17.jpg": "2650eeb7549f5316624a5dd618bd83ab",
"assets/assets/images/foodtek/foodtek18.jpg": "d7b49c63fe8bd063e11bee9956ef978b",
"assets/assets/images/foodtek/foodtek19.jpg": "331c68151c6b616123a0bd966e3284b7",
"assets/assets/images/foodtek/foodtek2.jpg": "1d8bf60ae7aeb7ef383a8a5281d4b0de",
"assets/assets/images/foodtek/foodtek20.jpg": "082ac000b430db04f3e8dfe070dad7e6",
"assets/assets/images/foodtek/foodtek21.jpg": "e39557980dadc32649f54ac0c052a76b",
"assets/assets/images/foodtek/foodtek3.jpg": "aabde3ebf89b6ea0792e2f46c0c8a2b8",
"assets/assets/images/foodtek/foodtek4.jpg": "4a7f24306ba4f8621598257e549fcf2d",
"assets/assets/images/foodtek/foodtek5.jpg": "7ff4831d325b1838c293c0b1de602f9a",
"assets/assets/images/foodtek/foodtek6.jpg": "0da7cf2d7f20adc3fa2e77750d358efe",
"assets/assets/images/foodtek/foodtek7.jpg": "12308716288269c134b58d4d5e09ebca",
"assets/assets/images/foodtek/foodtek8.jpg": "d6d3e3d92c7809f02efe1eb20c175d30",
"assets/assets/images/foodtek/foodtek9.jpg": "a7a856c245abeee5d7ecab9f8b103953",
"assets/assets/images/foodtek/sec1.PNG": "3fbb2d90b5333bf66777f9b5b8b5d917",
"assets/assets/images/foodtek/sec2.PNG": "fc448d952ea88c04c766851ce8e25bca",
"assets/assets/images/foodtek/sec3.PNG": "699b301d48294927d14ea757ac26c163",
"assets/assets/images/foodtek/sec4.PNG": "beb79843eb4be18de26b316bfad30cca",
"assets/assets/images/foodtek/sec5.PNG": "5a16252340324b3a3f4c10ec036d1fa6",
"assets/assets/images/foodtek/sec6.PNG": "f90eb601a89f52f6682671ea06190cb8",
"assets/assets/images/helpgood/helpgood_1.png": "b93134b8c9c66718a8a21b194842133e",
"assets/assets/images/helpgood/img.png": "2a30e1d4e57dd24a186d68fc4576d35c",
"assets/assets/images/helpgood/img_1.png": "864fa35548ce132a30bc08292db48f37",
"assets/assets/images/helpgood/img_2.png": "be768f0882a0ec7d3f15cca036d35164",
"assets/assets/images/helpgood/img_3.png": "62d2221128199ae47966e4870a4c8f02",
"assets/assets/images/helpgood/img_4.png": "c1da943f5e9bb5448a78121684675437",
"assets/assets/images/helpgood/img_5.png": "b0ed00ecae2ebd4667dbe39f2bc8cdfc",
"assets/assets/images/helpgood/img_6.png": "be3427d585eb5d29dd0b3a00f5261458",
"assets/assets/images/helpgood/img_7.png": "e402813bebd685e96285c6b53d427449",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "eeda21f574e5c97563838b163986f3b4",
"assets/NOTICES": "9334832b0406081e6606dcf759b4e821",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "cdfb02dea76c7baa84be0f84d2214927",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "c84341cc0997e14067b2b7c75a6d34c2",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "e3c0fa907d420115ac85676e9e1064f9",
"/": "e3c0fa907d420115ac85676e9e1064f9",
"main.dart.js": "d4d26e0e8aa930de5c6a8cd1f489f204",
"manifest.json": "73fa25c359021e8f207bffe244cd5e43",
"version.json": "64c25b0889628e8308c32cdf5b7f4947"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
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

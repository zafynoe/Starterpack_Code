# Atribusi & Lisensi

Repo ini **mem-vendor** (menyalin) skill buatan orang lain agar bisa dipakai lintas device
dan lintas agent. Semua sumber berlisensi permisif. Hak cipta tetap milik masing-masing
pembuat.

| Repo asal | Lisensi | Stars | Skill yang diambil |
|---|---|---|---|
| [obra/superpowers](https://github.com/obra/superpowers) | MIT | ~301k | 15 — metodologi: `brainstorming`, `writing-plans`, `executing-plans`, `test-driven-development`, `systematic-debugging`, `requesting-code-review`, `receiving-code-review`, `using-git-worktrees`, `finishing-a-development-branch`, `subagent-driven-development`, `dispatching-parallel-agents`, `verification-before-completion`, `diagnosing-superpowers`, `writing-skills`, `using-superpowers` |
| [emilkowalski/skills](https://github.com/emilkowalski/skills) | MIT | ~47k | 15 — design & motion: `emil-design-eng`, `animate`, `animate-expo`, `review-animations`, `improve-animations`, `find-animation-opportunities`, `animation-performance`, `animation-vocabulary`, `apple-design`, `write-swift`, `pick-ui-library`, `prototype`, `mobile-native`, `break-ui`, `ask-sonner` |
| [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) | MIT | ~55k | 8 — `cro`, `signup`, `onboarding`, `ab-testing`, `copywriting`, `customer-research`, `site-architecture`, `product-marketing` |
| [miqdadbadjuber/anti-slop](https://github.com/miqdadbadjuber/anti-slop) | MIT | ~6k | 6 — `antislop`, `antislop-ui`, `antislop-human`, `antislop-layoutmobile`, `antislop-copywriting`, `antislop-code` |
| [mattpocock/skills](https://github.com/mattpocock/skills) | MIT | ~294k | 3 — `grilling`, `grill-me`, `to-spec` |
| [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | Apache-2.0 | ~82k | 1 — `impeccable` (24 perintah desain) |
| [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | MIT | ~33k | 1 — `web-design-guidelines` |
| [anthropics/skills](https://github.com/anthropics/skills) | Apache-2.0 | ~182k | 1 — `webapp-testing` |
| [vercel-labs/skills](https://github.com/vercel-labs/skills) | MIT | — | 1 — `find-skills` |

**Total: 51 skill.**

## Catatan lisensi

- Repo `anthropics/skills` menyatakan bahwa *"many skills in this repo are open source
  (Apache 2.0)"*, sementara skill dokumen (`docx`, `pdf`, `pptx`, `xlsx`) bersifat
  **source-available, bukan open source**. Yang diambil di sini hanya `webapp-testing`
  (kelompok open source), bukan skill dokumen tersebut.
- `pbakaus/impeccable` memakai Apache-2.0: file `LICENSE` dan pemberitahuan atribusi dari
  repo asal harus dipertahankan bila didistribusikan ulang.
- Jika repo ini dibuat **publik**, sertakan salinan file `LICENSE` dari tiap repo asal atau
  tautkan ke repo asalnya seperti tabel di atas.
- `install.ps1` hanya menyalin file; tidak ada kode yang dijalankan dari sumber pihak ketiga.
  Beberapa skill membawa script sendiri (mis. `impeccable/scripts/`) — script itu dijalankan
  hanya ketika skill terkait dipakai.

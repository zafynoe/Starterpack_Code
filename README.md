# Starterpack Code — Zafynoe

Starterpack skill AI agent untuk kerja web & design engineering: **51 skill** plus satu
rule bootstrap yang membuat agent memakai skill yang tepat di fase yang tepat.

Dipakai di: **Cline** (VS Code / Web / CLI), Claude Code, Codex, Cursor, Gemini CLI,
GitHub Copilot, OpenCode, Antigravity.

## Isi repo

| Path | Isi |
|---|---|
| `.agents/skills/` | 51 skill (format Agent Skills — tiap folder punya `SKILL.md`) |
| `AGENTS.md` | Rule bootstrap: skill mana dipakai di fase mana (1–10) + pemetaan nama tool |
| `install.ps1` | Memasang semuanya ke device baru (`~/.agents/skills/` + `~/.agents/AGENTS.md`) |
| `sources.json` | Daftar repo asal tiap skill — untuk update |
| `ATTRIBUTION.md` | Sumber + lisensi pihak ketiga |

## Pakai di Cline Web / agent mana pun (tanpa install)

Buka folder repo ini sebagai workspace. Cline membaca:

- `.agents/skills/` sebagai **project skills** — terverifikasi untuk Cline, Codex, Cursor,
  Gemini CLI, GitHub Copilot, OpenCode, Antigravity
- `AGENTS.md` sebagai **workspace rule**

Tidak ada langkah install. Langsung minta sesuatu, misal *"Let's build a landing page"* →
`product-marketing` dan `brainstorming` aktif sebelum ada kode.

## Pakai di device baru (global — berlaku di semua project)

```powershell
git clone https://github.com/zafynoe/Starterpack_Code.git
cd Starterpack_Code
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

Lalu **mulai task baru** di agent supaya `~/.agents/AGENTS.md` terbaca.
Verifikasi: `npx --yes skills@latest list -g` (harus muncul 51 skill).

Timpa versi lama: tambahkan `-Force`.

## Update skill

Skill di sini adalah **salinan (vendored)** — sengaja, supaya tahan terhadap rename dan
penghapusan di repo asal. Contoh kejadian nyata: `product-marketing-context` → diganti nama
jadi `product-marketing`, dan `form-cro` → dilebur ke `cro`.

Untuk menarik versi terbaru, jalankan per repo asal (daftarnya di `sources.json`):

```powershell
npx --yes skills@latest add obra/superpowers -g -y -a cline claude-code codex cursor gemini-cli github-copilot opencode antigravity
```

lalu salin ulang hasilnya ke `.agents/skills/` repo ini dan commit.

## Alur kerja 10 fase

| Fase | Fokus | Skill utama |
|---|---|---|
| 1–2 | Arah produk + brainstorming | `product-marketing`, `brainstorming`, `grilling`, `to-spec` |
| 3 | Visualize (mockup, wireframe, varian) | `site-architecture`, `customer-research`, `impeccable shape/live/generate`, `prototype`, `break-ui` |
| 4 | Desain visual + UX | `impeccable` (24 perintah), `web-design-guidelines`, `onboarding`, `signup`, `emil-design-eng`, `apple-design`, `antislop` ×6, `pick-ui-library`, `mobile-native`, `ask-sonner`, + 8 skill animasi |
| 5 | Rencana teknis | `writing-plans` |
| 6 | Setup environment | `using-git-worktrees` |
| 7 | Implementasi | `test-driven-development`, `executing-plans` |
| 8 | Testing / QA | `test-driven-development`, `systematic-debugging`, `verification-before-completion`, `impeccable detect`, `webapp-testing` |
| 9 | Review + merge | `requesting-code-review`, `receiving-code-review`, `finishing-a-development-branch` |
| 10 | Deploy | ❌ tidak ada skill — manual |

Detail lengkap ada di `AGENTS.md`.

## Yang belum ada (sadar, bukan bug)

- **Deploy (fase 10)** — tidak ada skill. Dikerjakan manual atau pakai tooling hosting sendiri.
- **Subagent** — `subagent-driven-development` dan `dispatching-parallel-agents` butuh tool
  `spawn_agent` yang hanya ada di **Cline CLI/Desktop**. Di extension VS Code otomatis jatuh
  ke `executing-plans` (kerja inline).
- **Dokumen fondasi tidak ikut di repo** — `PRODUCT.md`, `DESIGN.md`, dan
  `.agents/product-marketing.md` adalah **output per project** yang dihasilkan skill lewat
  wawancara, bukan template. Itu memang harus unik per project.
- **Beberapa skill hanya jalan kalau dipanggil eksplisit** (`disable-model-invocation`):
  `prototype`, `pick-ui-library`, `grill-me`, `to-spec`.
- **`to-spec` butuh `/setup-matt-pocock-skills`** untuk bisa publish ke issue tracker.

## Lisensi

Skill pihak ketiga tetap milik pembuatnya — daftar sumber dan lisensinya ada di
[ATTRIBUTION.md](ATTRIBUTION.md) (MIT dan Apache-2.0).

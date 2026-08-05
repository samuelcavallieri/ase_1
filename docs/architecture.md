# Arquitetura

## Resolução

O jogo usa viewport lógico de 640×360 e escala inteira. Sprites e cenários usam filtragem nearest-neighbor.

## Diretórios

- `src/core`: inicialização, autoloads e serviços globais.
- `src/actors`: jogador, aliados, NPCs e criaturas.
- `src/world`: mapas, capítulos e encontros.
- `src/ui`: HUD, menus, diálogos e acessibilidade.
- `src/battle`: combate e dados de habilidades.
- `src/cutscenes`: sequências dirigidas e timeline.
- `assets`: arquivos importados pelo jogo.
- `art_source`: fontes editáveis de arte.
- `audio`: arquivos usados pelo jogo e fontes musicais leves.
- `data`: narrativa, missões e localização.
- `tests`: testes automatizados e cenas de verificação.

## Autoloads

- `GameState`: progresso narrativo e grupo.
- `SceneRouter`: mudança segura de cena.
- `AudioManager`: música, ambiência e buses.
- `SaveManager`: persistência versionada.

Novos globais só devem ser criados quando o ciclo de vida realmente for global.

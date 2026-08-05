# Pipeline de arte e animação

1. Criar o arquivo-fonte em `art_source/aseprite` ou `art_source/pixelorama`.
2. Usar uma grade fixa por personagem.
3. Nomear tags: `idle_down`, `walk_down`, `walk_side`, `walk_up`, `run`, `interact`, `hurt`.
4. Exportar PNG para `assets/sprites`.
5. Nunca redimensionar pixel art com interpolação.
6. Configurar importação com filtro desligado e mipmaps desligados.

Sprites-base começarão em 48×64 ou 64×64; chefes e aparições podem exceder essa grade.

---
name: visual-styler
description: Applies predefined art styles (pixel-rpg, lowpoly-island, urban-sketch, ascii-crt, impasto, hologra) to animal, character, and subject descriptions. Triggers on 'style:' keyword.
---

# Visual Style Generator Skill

사용자가 `style: [스타일명]` 및 `피사체: [설명]` 형식으로 요청하면, 아래 사전(Style Dictionary)의 렌더링 키워드를 피사체와 결합하여 고품질 프롬프트 또는 에셋을 생성한다.

## 1. Style Dictionary
- pixel-rpg: 16-bit retro pixel art, vibrant color palette, clear sprite outlines, nostalgic JRPG game aesthetic, crisp details.
- lowpoly-island: Low poly 3D isometric modeling, flat shading, clean geometric edges, pastel-toned ambient lighting, miniature diorama feel.
- urban-sketch: Loose pen and watercolor wash, architectural line art, natural paper texture, energetic hatching, urban travel diary style.
- ascii-crt: Monochromatic ASCII text character composition, retro CRT monitor phosphor green glow, scanlines, slight curvature.
- impasto: Heavy oil painting texture, visible palette knife strokes, thick tactile paint ridges, dynamic expressive brushwork, rich shadows.
- hologra: Futuristic iridescent hologram, semitransparent neon layers, chromatic aberration, glowing cybernetic wireframe accents.

## 2. Execution Rules
1. **스타일 매핑**: 입력된 `style:` 키워드에 해당하는 프리셋 디스크립션을 피사체에 결합한다.
2. **다양성 및 복수 개체 처리 (Multi-variation Rule)**:
   - "여러가지 색", "다양한 품종", "캐릭터 세트", "바리에이션" 등의 요청이 있을 경우 단일 개체에 색을 섞지 않고, **서로 다른 색상/무늬/견종·묘종을 지닌 여러 독립 캐릭터들이 정렬된 컬렉션/스프라이트 시트(Sprite Sheet)** 형태로 구성한다.
   - **피사체가 강아지인 경우**: 
     - 모색 및 견종 다양화 (예: 골든 리트리버 황금색, 시바견 적갈색/블랙탄, 비숑/말티즈 화이트, 웰시코기 트라이컬러/비콘, 프렌치 불독, 비글 등).
   - **피사체가 고양이인 경우**: 
     - 모색 및 패턴 다양화 (예: 치즈 태비, 고등어 태비, 턱시도, 올블랙, 화이트, 삼색이(캘리코), 러시안 블루 등).
   - **기타 동물/피사체인 경우**: 
     - 요청된 피사체의 대표적인 색상 테마 및 외형 변화를 골고루 분배한 세트로 구성.
3. **결과물 출력**:
   - 이미지 생성 도구(MCP 서버 / Image API)가 연동되어 있다면 스프라이트/그리드 시트 형태의 이미지를 직접 생성한다.
   - 텍스트/코드 기반 환경이라면 Midjourney, Imagen, DALL-E 등에서 즉시 사용할 수 있도록 최적화된 영문 프롬프트와 개체 구성 목록을 제공한다.
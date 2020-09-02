# Tasks

## v1

### Base

- Structure

  - Architecture
  - Project details

    - Name - Chuck Norris Jokes
    - Colors https://coolors.co/F15B23-228dbb-222222-8c6239
      - Flame #F15B23
      - Blue NCS #228DBB
      - Eerie Black #222222
      - Coyote Brown #8C6239
    - Font

      - Body 16px/1.5 "Courier New", Arial, sans-serif -- eerie
      - Title 24px font/04b_30.woff Flame

    - Icon https://api.chucknorris.io/img/favicon.ico
    - Splash https://api.chucknorris.io/img/chucknorris_logo_coloured_small@2x.png

  - Test
  - Network
    - Cache
    - DB

- Dependencies

  - Dependency Injection
  - Images
  - Cache
  - DB
  - Network
  - Rx

- CI / CD

- Solution.md
  - Description
  - Approach
  - up-and-running instructions

### Features

All epic should _include model + tests + mock_

- Categories

  - Fetch request
  - DB
  - Random
  - Default Category

- Home layout

  - Empty state
  - Search button
    - Cupertino: Appbar
    - Material: FAB
  - Result list
  - Error messages
  - Empty results

- Fact

  - Layout tile
  - Share action
  - Font size
  - API Rest Request

- Suggestions

  - Tile
  - Get 8 randomly
  - Callback

- Past Searches

  - Tile
  - Callback

- Search
  - Search field
    - Keyboard input type
    - Search button action
  - Integrate Suggestion
  - Integrate Past Search
  - API Rest Request

## v2 Auto retry

- Settings
  - Time between requests
  - Maximum try
- Handle errors (which try again)
- Network auto retry

## v3 Offline

- Save every requets
- Proxy to search local first
- Check online / offline
- See all cache
- Add new facts from past searches when online
- Random up to 10 items in home from cache

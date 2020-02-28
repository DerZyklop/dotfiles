module.exports = {
  "disableEmoji": false,
  "list": [
    "fix",
    "ui",
    "feat",
    "perforce",
    "i18n",
    "text",
    "test",
    "docs",
    "chore",
    "refactor",
    "ci",
    "perf"
  ],
  "maxMessageLength": 64,
  "minMessageLength": 3,
  "questions": [
    "type",
    "scope",
    "subject",
    "body",
    "breaking",
    "issues",
    "lerna"
  ],
  "types": {
    "feat": {
      "description": "A new feature",
      "emoji": "✨",
      "value": "feat"
    },
    "fix": {
      "description": "A bug fix",
      "emoji": "🐛",
      "value": "fix"
    },
    "perforce": {
      "description": "Changes from perforce (get latest)",
      "emoji": "🔀",
      "value": "perforce"
    },
    "i18n": {
      "description": "Internationalisation",
      "emoji": "🌍",
      "value": "i18n"
    },
    "text": {
      "description": "Text changes",
      "emoji": "💬",
      "value": "text"
    },
    "test": {
      "description": "Adding missing tests",
      "emoji": "✅",
      "value": "test"
    },
    "chore": {
      "description": "Build process or auxiliary tool changes",
      "emoji": "🤖",
      "value": "chore"
    },
    "ci": {
      "description": "CI related changes",
      "emoji": "🔧",
      "value": "ci"
    },
    "docs": {
      "description": "Documentation only changes",
      "emoji": "📝",
      "value": "docs"
    },
    "perf": {
      "description": "A code change that improves performance",
      "emoji": "⚡️",
      "value": "perf"
    },
    "refactor": {
      "description": "A code change that neither fixes a bug or adds a feature",
      "emoji": "♻️",
      "value": "refactor"
    },
    "ui": {
      "description": "Markup, white-space, formatting, missing semi-colons...",
      "emoji": "💅",
      "value": "ui"
    },
  }
};

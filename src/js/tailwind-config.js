tailwind.config = {
    darkMode: "class",
    theme: {
      extend: {
        colors: {
          "primary": "#4C33EB",
          "primary-container": "#4C33EB",
          "on-primary": "#ffffff",
          "secondary": "#4C33EB",
          "secondary-container": "#4C33EB",
          "on-secondary": "#ffffff",
          "secondary-fixed": "#EAE6FF",
          "on-secondary-fixed": "#241873",
          "secondary-fixed-dim": "#D6CEFF",
          "background": "#faf9f6",
          "surface": "#faf9f6",
          "surface-container-lowest": "#ffffff",
          "surface-container-low": "#f4f3f0",
          "surface-container": "#efeeeb",
          "surface-container-high": "#e9e8e5",
          "surface-container-highest": "#e3e2df",
          "surface-variant": "#e3e2df",
          "on-surface": "#1a1c1a",
          "on-surface-variant": "#44474e",
          "outline": "#75777f",
          "outline-variant": "#c5c6cf",
          "tertiary": "#4C33EB",
          "tertiary-container": "#4C33EB",
          "on-primary-container": "#D6CEFF"
        },
        borderRadius: {
          "DEFAULT": "0.25rem",
          "lg": "0.5rem",
          "xl": "0.75rem",
          "2xl": "1rem",
          "3xl": "1.5rem",
          "full": "9999px"
        },
        fontFamily: {
          sans: ["Plus Jakarta Sans", "Inter", "sans-serif"],
          "body": ["Inter", "sans-serif"],
          "headline": ["Plus Jakarta Sans", "sans-serif"]
        }
      }
    }
  }

  tailwind.config.theme.extend.colors.blue = {
    50: "#F3F1FF", 100: "#EAE6FF", 200: "#D6CEFF", 300: "#B7A9FF", 400: "#8A75FF",
    500: "#4C33EB", 600: "#4C33EB", 700: "#3D28C4", 800: "#30209B", 900: "#241873"
  };
  tailwind.config.theme.extend.colors.orange = {
    50: "#F3F1FF", 100: "#EAE6FF", 200: "#D6CEFF", 300: "#B7A9FF", 400: "#8A75FF",
    500: "#4C33EB", 600: "#4C33EB", 700: "#3D28C4", 800: "#30209B", 900: "#241873"
  };
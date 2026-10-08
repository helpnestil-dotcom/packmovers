tailwind.config = {
      darkMode: "class",
      theme: {
        extend: {
          "colors": {
            "surface-dim": "#dbdad7",
            "on-error-container": "#93000a",
            "tertiary-fixed": "#EAE6FF",
            "surface-variant": "#e3e2df",
            "surface": "#faf9f6",
            "secondary-container": "#4C33EB",
            "primary": "#4C33EB",
            "on-primary-fixed-variant": "#30209B",
            "surface-bright": "#faf9f6",
            "outline-variant": "#c5c6cf",
            "surface-container-lowest": "#ffffff",
            "surface-container-low": "#f4f3f0",
            "inverse-surface": "#2f312f",
            "on-primary-fixed": "#241873",
            "inverse-primary": "#D6CEFF",
            "secondary-fixed": "#EAE6FF",
            "on-secondary-container": "#241873",
            "primary-fixed-dim": "#D6CEFF",
            "on-primary-container": "#D6CEFF",
            "primary-fixed": "#EAE6FF",
            "error-container": "#ffdad6",
            "on-surface": "#1a1c1a",
            "background": "#faf9f6",
            "surface-container-high": "#e9e8e5",
            "on-tertiary-fixed-variant": "#30209B",
            "on-tertiary-container": "#4C33EB",
            "on-secondary-fixed": "#241873",
            "on-tertiary": "#ffffff",
            "tertiary": "#4C33EB",
            "error": "#ba1a1a",
            "secondary": "#4C33EB",
            "surface-container": "#efeeeb",
            "surface-container-highest": "#e3e2df",
            "on-secondary-fixed-variant": "#30209B",
            "on-surface-variant": "#44474e",
            "primary-container": "#4C33EB",
            "tertiary-container": "#4C33EB",
            "outline": "#75777f",
            "on-background": "#1a1c1a",
            "secondary-fixed-dim": "#D6CEFF",
            "tertiary-fixed-dim": "#D6CEFF",
            "on-secondary": "#ffffff",
            "surface-tint": "#4C33EB",
            "inverse-on-surface": "#f2f1ee",
            "on-tertiary-fixed": "#241873",
            "on-primary": "#ffffff",
            "on-error": "#ffffff"
          },
          "borderRadius": {
            "DEFAULT": "0.25rem",
            "lg": "0.5rem",
            "xl": "0.75rem",
            "full": "9999px"
          },
          "spacing": {
            "space-xl": "2rem",
            "space-xs": "0.25rem",
            "margin-tablet": "2rem",
            "margin-desktop": "3rem",
            "gutter-tablet": "1.5rem",
            "space-md": "1rem",
            "space-lg": "1.5rem",
            "margin": "1rem",
            "space-sm": "0.5rem",
            "gutter": "1rem",
            "gutter-desktop": "2rem"
          },
          "fontFamily": {
            "body-lg": ["Inter"],
            "label-lg": ["Plus Jakarta Sans"],
            "headline-lg": ["Plus Jakarta Sans"],
            "label-md": ["Plus Jakarta Sans"],
            "body-md": ["Inter"],
            "display-lg": ["Plus Jakarta Sans"],
            "headline-sm": ["Plus Jakarta Sans"],
            "body-sm": ["Inter"],
            "display-lg-mobile": ["Plus Jakarta Sans"],
            "label-sm": ["Plus Jakarta Sans"],
            "headline-md": ["Plus Jakarta Sans"]
          },
          "fontSize": {
            "body-lg": ["16px", { "lineHeight": "24px", "fontWeight": "400" }],
            "label-lg": ["14px", { "lineHeight": "20px", "letterSpacing": "0.01em", "fontWeight": "600" }],
            "headline-lg": ["26px", { "lineHeight": "34px", "letterSpacing": "-0.01em", "fontWeight": "700" }],
            "label-md": ["12px", { "lineHeight": "16px", "letterSpacing": "0.02em", "fontWeight": "600" }],
            "body-md": ["14px", { "lineHeight": "20px", "fontWeight": "400" }],
            "display-lg": ["40px", { "lineHeight": "48px", "letterSpacing": "-0.02em", "fontWeight": "700" }],
            "headline-sm": ["18px", { "lineHeight": "24px", "fontWeight": "600" }],
            "body-sm": ["12px", { "lineHeight": "16px", "fontWeight": "400" }],
            "display-lg-mobile": ["30px", { "lineHeight": "38px", "letterSpacing": "-0.01em", "fontWeight": "700" }],
            "label-sm": ["11px", { "lineHeight": "14px", "letterSpacing": "0.03em", "fontWeight": "600" }],
            "headline-md": ["20px", { "lineHeight": "28px", "fontWeight": "600" }]
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
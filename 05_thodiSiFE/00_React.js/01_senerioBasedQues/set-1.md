# Top 5 React Scenario Based Interview Questions and Answers 2025

---

## Table of Contents

1. [How do you handle large forms in React?](#1-handling-large-forms-in-react)
2. [How do you implement dark mode in a React app?](#2-implementing-dark-mode)
3. [How do you prevent Cross-Site Scripting (XSS) in React?](#3-preventing-cross-site-scripting-xss)
4. [How do you handle online and offline states in React?](#4-handling-online-and-offline-states)
5. [How do you resolve caching issues in production React apps?](#5-resolving-caching-issues-in-production)

---

## 1. Handling Large Forms in React

**Q:** How do you efficiently manage forms with 20+ fields in React?  
**A:**

- Use form libraries like **Formik** or **React Hook Form** for optimized state management and minimal re-renders.
- Structure the form into logical sections (e.g., personal info, address, preferences) for better usability.
- Use controlled components with validation for robust state control.
- Dynamically render fields based on user input to streamline the experience.
- Avoid storing all fields in a single state object to prevent unnecessary re-renders.

---

## 2. Implementing Dark Mode

**Q:** What is the best way to implement dark mode in a React application?  
**A:**

- Detect system preference using CSS media queries like `prefers-color-scheme`.
- Store user preference in **localStorage** to persist theme selection.
- Manage theme state globally using **Context API** or **Redux**.
- Apply styles using CSS variables or UI libraries (e.g., Material UI) for consistency.
- Ensure the theme is applied across all components.

---

## 3. Preventing Cross-Site Scripting (XSS)

**Q:** How can you prevent XSS vulnerabilities in React apps?  
**A:**

- React escapes values by default, but avoid using `dangerouslySetInnerHTML`.
- Sanitize user input with libraries like **DOMPurify**.
- Set **Content Security Policy (CSP)** headers to enforce security.
- Never assign user input directly to attributes or the DOM.
- Always validate and sanitize all user-generated content.

---

## 4. Handling Online and Offline States

**Q:** How do you manage online and offline states in a React application?  
**A:**

- Use the `navigator.onLine` API to detect connectivity.
- Listen for `online` and `offline` events to update UI feedback.
- Implement **service workers** to cache assets and API responses for offline use.
- Notify users about connectivity changes and fallback to cached data when offline.

---

## 5. Resolving Caching Issues in Production

**Q:** What steps do you take if a React app update is not reflected in production?  
**A:**

- Check service worker caching in Chrome DevTools for aggressive caching.
- Use hashed filenames for chunk versioning so browsers detect updates.
- Set backend cache control headers (`no-cache`, `must-revalidate`) to force fresh loads.
- Add an app version meta tag to help manage and display the current version.
- Ensure service workers are updated and old caches are cleared on deployment.

---

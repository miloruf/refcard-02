import { render, screen } from '@testing-library/react';
import App from './App';

test('zeigt den Titel an', () => {
  render(<App />);
  expect(screen.getByText(/App Ref. Card 02/i)).toBeInTheDocument();
});

test('zeigt die Statusmeldung an', () => {
  render(<App />);
  expect(screen.getByText(/up and running/i)).toBeInTheDocument();
});

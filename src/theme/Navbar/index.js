import React from 'react';
import Navbar from '@theme-original/Navbar';

export default function NavbarWrapper(props) {
  const init = () => {
    const params = new URLSearchParams(location.search);
    // in warudo ?platform=warudo
    const name = params.get('platform');
  }

  return (
    <>
      <Navbar {...props} />
    </>
  );
}

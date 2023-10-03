import React, {useEffect, useState} from 'react';
import Navbar from '@theme-original/Navbar';
import { useColorMode } from '@docusaurus/theme-common';

export default function NavbarWrapper(props) {
  const init = () => {
    const params = new URLSearchParams(location.search);
    // in warudo ?platform=warudo
    const platform = params.get('platform');
    if(platform && platform == 'warudo') {
      sessionStorage.setItem('platform', platform);
      setIsInApp(true)
    }
  }

  const [isInApp, setIsInApp] = useState(false);
  const c = useColorMode();

  useEffect(() => {
    init();
  })

  return (
    <>
      <Navbar {...props} />
      {isInApp ? (
        <>
        <style dangerouslySetInnerHTML={{__html: `
        *{
          }
          `}}></style>
        </>
      ) : null}
    </>
  );
}


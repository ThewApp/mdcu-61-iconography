import React from 'react'
import styled from 'styled-components'

const Wrapper = styled.span`
  white-space: nowrap;
`;

export default function (props) {
    return <>
        <wbr />
            <Wrapper>{props.children}</Wrapper>
        <wbr />
    </>
}

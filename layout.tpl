{{ include file="_tpl/_html-head.tpl" }}

    <header{{ if $gimme->article->nav }} class="nav"{{ /if }}>
        <a href="/" id="home">Home</a>
        {{ if $gimme->article->nav }}
        <a href="#" id="collapse"></a>
        {{ $i = 1 }}
        {{ list_related_articles }}
            {{ if $gimme->current_list->at_beginning }}
            <nav>
                <ul>
            {{ /if }}
            {{ if $gimme->article->display_title && $gimme->article->show_in_nav }}
                    <li><a href="#{{ $gimme->article->number }}" title="{{ $gimme->article->display_title }}"><span>{{ $i }}</span> {{ $gimme->article->display_title }}</a>
                    {{ $j = 1 }}
                    {{ list_related_articles }}
                        {{ if $gimme->article->display_title && $gimme->article->show_in_nav }}
                            <li class="child"><a href="#{{ $gimme->article->number }}" title="{{ $gimme->article->display_title }}"><span>{{ $i }}.{{ $j }}</span> {{ $gimme->article->display_title }}</a></li>
                            {{ assign var = $j value = $j++ }}
                        {{ /if }}
                    {{ /list_related_articles }}
                    </li>
                    {{ assign var = $i value = $i++ }}
            {{ /if }}
            {{ if $gimme->current_list->at_end || $gimme->current_list->at_end && $gimme->current_list->index == 1 }}
                </ul>
            </nav>
            {{ /if }}
        {{ /list_related_articles }}
        {{ /if }}
        <a href="#" class="mute">Mute</a>
        {{ assign var="l" value="0" }}
        {{ assign var="currLan" value=$gimme->language->code }}

    </header>

    {{ list_related_articles }}
        {{ if $gimme->current_list->at_beginning }}
        <section>
            <article>
        {{ /if }}
    {{ /list_related_articles }}
    {{ if $gimme->browser->ua_type != "mobile" }}
      {{ include file="_tpl/_storyteller/ambient.tpl" }}
    {{ /if }}
    {{ list_related_articles }}
        {{ if $gimme->article->type_name == "ST_element" }}
            {{ include file="_tpl/_storyteller/ST-segment.tpl" }}
        {{ /if }}
        {{ if $gimme->article->type_name == "ST_textblock" }}
            {{ include file="_tpl/_storyteller/text-block.tpl" }}
        {{ /if }}
        {{ if $gimme->article->slideshow }}
            {{ include file="_tpl/_storyteller/slideshow.tpl" }}
        {{ /if }}

        {{ if $gimme->current_list->at_end }}
            </article>
        </section>
        {{ /if }}
    {{ /list_related_articles }}

{{ include file="_tpl/_html-foot.tpl" }}

</body>
</html>

return {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = 'org',
    config = function()
        require('orgmode').setup {
            org_agenda_files = { '~/org/agenda.org' },
            org_default_notes_file = '~/org/notes.org',
            org_archive_files = { '~/org/archive.org' },
            org_span_tags = {
                'TODO',
                'NEXT',
                'DONE',
                'WAITING',
                'HOLD',
                'CANCELLED',
                'NOPRIORITY',
                'A',
                'B',
                'C',
            },
            org_heading_delimiter = '-',
            org_list_bullets = '*-+',
            org_date_link_format = '(%s)',
        }
    end,
}

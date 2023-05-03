#!/usr/bin/env fish

# Copies the most recent resume PDF into to the portfolio.  This make it simple.

# One approach would be to parse the date in the pdf file names.  That is a little hard.
# Instead, lets pick the one with the last filname. This works when you have a fairly strict naming convention.
set resume_pdfs ~/Documents/resume/resume*.pdf

# reverse sort the resume filenames, the first one should be the correct one
# This isn't needed, the results of the above are in order.
# set rev_ord_pdfs (path sort -r $resume_pdfs)

# set resume_to_copy $rev_ord_pdfs[1]
# get the last one in the list
set resume_to_copy $resume_pdfs[-1]

# This approach is a bit hackish.

echo "Copying $resume_to_copy to ./source/pdfs/resume.pdf"
cp $resume_to_copy ./source/pdfs/resume.pdf

